-- Provides tabs for buffers
return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = { "", "" },
          indicator = {
            style = "none",
          },
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "",
              padding = 0,
            },
          },
        },
        highlights = {
          fill = {
            bg = "NONE",
          },
        },
      })
    end,
  },
}
