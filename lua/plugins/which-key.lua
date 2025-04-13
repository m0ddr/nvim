return{
-- Which key for key bindings pop-up menu
-- ref: https://github.com/folke/which-key.nvim
	{
		"folke/which-key.nvim",
		lazy = true,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
}
