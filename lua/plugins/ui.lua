-- This config file is made up of plug-ins that essentiall change Nvim into an IDE
-- This is where all my UI plug-ins are captured.
return {
	-- the colorscheme should be available when starting Neovim
	{
		"rose-pine/neovim",
    name = "rose-pine",
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	-- handles simple file explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	-- Provides tabs for buffers
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({})
		end,
	},
	-- Deals with the status line shown at the bottom
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
				},
			})
		end,
	},
	-- Indentation guide lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = {
				filetypes = {
					"help",
					"dashboard",
					"nvim-tree",
					"lazy",
					"mason",
				},
			},
		},
	},
}
