-- Custom Dashboard on start
return {
  {
    "nvimdev/dashboard-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = {
            [[                                                            ]],
            [[                                                            ]],
            [[                                                            ]],
            [[                                                            ]],
            [[ 888b    888                  888     888 d8b               ]],
            [[ 8888b   888                  888     888 Y8P               ]],
            [[ 88888b  888                  888     888                   ]],
            [[ 888Y88b 888  .d88b.   .d88b. Y88b   d88P 888 88888b.d88b.  ]],
            [[ 888 Y88b888 d8P  Y8b d88""88b Y88b d88P  888 888 "888 "88b ]],
            [[ 888  Y88888 88888888 888  888  Y88o88P   888 888  888  888 ]],
            [[ 888   Y8888 Y8b.     Y88..88P   Y888P    888 888  888  888 ]],
            [[ 888    Y888  "Y8888   "Y88P"     Y8P     888 888  888  888 ]],
            [[                                                            ]],
            [[                                                            ]],
            [[                                                            ]],
          },
          center = {
            {
              action = "ene",
              desc = " New File",
              icon = " ",
              key = "n",
            },
            {
              action = "Telescope oldfiles",
              desc = " Recent Files",
              icon = "󰋚 ",
              key = "r",
            },
            {
              action = "Telescope live_grep",
              desc = " Find Text",
              icon = " ",
              key = "g",
            },
            {
              action = "Telescope find_files",
              desc = " Find File",
              icon = " ",
              key = "f",
            },
            {
              action = "Lazy",
              desc = " Lazy Package Manager",
              icon = "󰒲 ",
              key = "l",
            },
            {
              action = "Mason",
              desc = " Mason Package Manager",
              icon = "󰺪 ",
              key = "m",
            },
            {
              action = function()
                vim.api.nvim_input("<cmd>qa<cr>")
              end,
              desc = " Quit",
              icon = " ",
              key = "q",
            },
          },
          footer = { "where the magic happens" },
        },
      })
    end,
  },
}
