return{
-- Treesitter is a parser generator tool and incremental parsing libary,
	-- plug-in essentially allows for Treesitter-based highlighting
	-- ref: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "lua", "python", "vim", "vimdoc", "rust" },
				auto_install = false,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
