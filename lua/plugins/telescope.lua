return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  -- ui-select only overrides vim.ui.select once telescope loads, so defer the
  -- load to the first select call rather than waiting on a :Telescope command
  init = function()
    vim.ui.select = function(...)
      require("lazy").load({ plugins = { "telescope.nvim" } })
      return vim.ui.select(...)
    end
  end,
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.95,
          height = 0.95,
        },
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
          "__pycache__/",
          "%.pyc",
        },
      },
      extensions = {
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    telescope.load_extension("file_browser")
    telescope.load_extension("ui-select")
  end,
}
