return {
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("Comment").setup({
        -- Disable default mappings since we define them in mappings.lua
        mappings = {
          basic = false,
          extra = false,
        },
      })
    end,
  },
}
