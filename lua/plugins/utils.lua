-- All of these plugins offer some form of utility I deemed essential/useful.
-- Feel free to amend as per your requirements.
return {
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
	-- hop utility
	-- ref: https://github.com/hadronized/hop.nvim
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
  -- toggle terminal
  -- ref: https://github.com/akinsho/toggleterm.nvim
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
      size = 20,
      hide_numbers = true,
      start_in_insert = true,
      persist_size = true,
      close_on_exit = true,
      direction = "float",
      float_opts = { border = "curved" }
      })
    end
  },
}
