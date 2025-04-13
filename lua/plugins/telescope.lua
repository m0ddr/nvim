return{
	-- Telescope fuzzy finder (requires ripgrep installed)
	-- ref: https://github.com/nvim-telescope/telescope.nvim
	{ "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
	-- Applies telescope-ui to any pop-up menus
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
