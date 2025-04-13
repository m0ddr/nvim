return{
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
