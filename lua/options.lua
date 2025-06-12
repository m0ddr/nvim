-- leader key and local-leader have been left as default
-- I previously used NvChad and LazyVim so like this config
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Use vim.opt instead of vim.cmd for better performance
local opt = vim.opt

-- Indentation
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Additional useful options
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Performance improvements
opt.updatetime = 250
opt.timeoutlen = 300

-- Disable unnecessary providers for faster startup
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
