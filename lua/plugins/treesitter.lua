return{
-- Treesitter is a parser generator tool and incremental parsing libary,
	-- plug-in essentially allows for Treesitter-based highlighting
	-- ref: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			-- additional languages can be installed via :TSIntall <language>
			configs.setup({
				auto_install = true, -- automatically install parser for new languages
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
