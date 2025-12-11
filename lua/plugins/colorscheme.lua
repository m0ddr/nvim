return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup({
        options = {
          transparent = false,
          styles = {
            comments = "italic",
          },
        },
      })

      vim.cmd.colorscheme("terafox")
    end,
  },
}
