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

-- Additional useful options
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Spell checking
opt.spell = true
opt.spelllang = "en_gb"

-- Performance improvements
opt.updatetime = 500
opt.timeoutlen = 300

-- Disable unnecessary providers for faster startup
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = "always",
    header = "",
    border = "rounded",
    focusable = false,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Auto-show diagnostic float when cursor holds on a line with diagnostics
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local line_diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
    if #line_diagnostics > 0 then
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  end
})
