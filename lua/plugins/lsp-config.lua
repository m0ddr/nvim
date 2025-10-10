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
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright" },
        automatic_installation = true,
      })
      
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config('pyright', {
        capabilities = capabilities,
        filetypes = { "python" },
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
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              diagnosticMode = "off",
              autoImportCompletions = true,
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        },
      })

      vim.lsp.enable('lua_ls')
      vim.lsp.enable('pyright')
    end,
  },
}
