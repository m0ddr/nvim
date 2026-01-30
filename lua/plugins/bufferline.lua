return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers",
      separator_style = { "", "" },
      indicator = { style = "none" },
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
    },
    highlights = {
      fill = { bg = "NONE" },
    },
  },
}
