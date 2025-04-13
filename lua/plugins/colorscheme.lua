return {
	-- the colorscheme should be available when starting Neovim
	{
    "vague2k/vague.nvim",
		lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "vague"
    end
		},
	}
