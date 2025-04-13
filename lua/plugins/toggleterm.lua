return {
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
