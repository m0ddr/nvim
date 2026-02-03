return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile"},
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = { "lua", "python", "vim", "vimdoc", "rust" },
        highlight = { enable = true },
        indent = { enable = true },
    },
}
