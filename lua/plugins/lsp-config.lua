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
        automatic_installation = true,
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
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("pyright", {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                reportOptionalMemberAccess = "warning",
                reportOptionalOperand = "warning",
                reportOptionalSubscript = "warning",
                reportUnknownMemberType = "none",
                reportUnknownParameterType = "none",
                reportUnknownVariableType = "none",
                reportUnknownArgumentType = "none",
                reportMissingTypeStubs = "none",
              },
            },
          },
        },
      })

      vim.lsp.config("ruff", {
        cmd = { "ruff", "server", "--preview" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "ruff.toml", ".git" },
        capabilities = capabilities,
        init_options = {
          settings = {
            organizeImports = true,
            fixAll = true,
          },
        },
      })

      -- Enable the servers (replaces manual FileType autocmds)
      vim.lsp.enable({ "lua_ls", "pyright", "ruff" })
    end,
  },
}
