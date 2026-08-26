local function pyproject_has_ruff_section(path)
  if vim.fn.filereadable(path) ~= 1 then return false end

  for _, line in ipairs(vim.fn.readfile(path)) do
    if line:match("^%s*%[tool%.ruff") then return true end
  end

  return false
end

-- Returns the filename of the local ruff config found in `root`, or nil if none exists.
local function find_local_ruff_config(root)
  if not root then return nil end

  local standalone = vim.fs.find(
    { "ruff.toml", ".ruff.toml" },
    { path = root, upward = true, stop = vim.fs.dirname(root) }
  )
  if #standalone > 0 then return vim.fs.basename(standalone[1]) end

  if pyproject_has_ruff_section(root .. "/pyproject.toml") then return "pyproject.toml" end

  return nil
end

local function setup_lsp_attach()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then return end

      -- Enable inlay hints
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      end

      -- Disable ruff hover in favour of pyright
      if client.name == "ruff" then
        client.server_capabilities.hoverProvider = false
      end
    end,
  })
end

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ruff" },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup LspAttach autocmd
      setup_lsp_attach()

      -- Configure servers using vim.lsp.config
      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
        capabilities = capabilities,
        settings = require("lspsettings.lua_ls"),
      })

      vim.lsp.config("pyright", {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
        capabilities = capabilities,
        settings = {
          python = {
            analysis = require("lspsettings.pyright"),
          },
        },
      })

      vim.lsp.config("ruff", {
        cmd = { "ruff", "server" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
        capabilities = capabilities,
        before_init = function(_, config)
          local root = config.root_dir
          local local_config = find_local_ruff_config(root)

          if not local_config then
            config.init_options = {
              settings = {
                configuration = vim.fn.stdpath("config") .. "/lua/lspsettings/ruff.toml",
              },
            }
          end

          vim.notify(
            local_config and ("local discovery configuration (" .. local_config .. ")")
              or "using global configuration",
            vim.log.levels.INFO,
            { title = "Ruff" }
          )
        end,
      })
    end,
  },
}
