return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "live grep" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "recent files" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "help tags" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
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
