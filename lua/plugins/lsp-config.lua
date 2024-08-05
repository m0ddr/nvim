-- LSP config for Nvim (Thanks Bill Gates)
return {
	-- Mason: package manager for LSP servers, DAP servers, linters, and formatters.
	-- Packages can be installed via :MasonInstall
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	-- Bridge for mason and lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ruff"},
			})
		end,
	},
	-- Config plugin for the Nvim LSP client
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			-- capabilities must be set up for each lspconfig
			-- to allow for code completion from respective lsp server
			lspconfig.lua_ls.setup({
        capabilities = capabilities
			})
      lspconfig.ruff.setup({
        capabilities = capabilities
      })
			lspconfig.pyright.setup({
        capabilities = capabilities
			})
		end,
	},
}
