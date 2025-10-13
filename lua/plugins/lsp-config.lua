local function on_attach(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ruff" },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        cmd = { "lua-language-server" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        filetypes = { "lua" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      vim.lsp.config("pyright", {
        cmd = { "pyright-langserver", "--stdio" },
        root_markers = {
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          "pyrightconfig.json",
          ".git",
          "uv.lock",
          "poetry.lock"
        },
        filetypes = { "python" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoImportCompletions = true,
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                -- Downgrade noisy types to warnings
                reportOptionalMemberAccess = "warning",
                reportOptionalOperand = "warning",
                reportOptionalSubscript = "warning",
                -- Disable pedantic types
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
        root_markers = {
          "pyproject.toml",
          "ruff.toml",
          ".ruff.toml",
          ".git",
        },
        filetypes = { "python" },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          args = {},
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function(args)
          vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            root_dir = vim.fs.root(args.buf, { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" }),
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function(args)
          local root_dir = vim.fs.root(args.buf, {
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            "pyrightconfig.json",
            ".git",
            "uv.lock",
            "poetry.lock"
          })

          vim.lsp.start({
            name = "pyright",
            cmd = { "pyright-langserver", "--stdio" },
            root_dir = root_dir,
          })

          vim.lsp.start({
            name = "ruff",
            cmd = { "ruff", "server", "--preview" },
            root_dir = root_dir,
          })
        end,
      })
    end,
  },
}
