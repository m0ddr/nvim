-- Simple mapping file
local map = vim.keymap.set

-- LSP keymaps
map("n", "<leader>li", vim.lsp.buf.hover, {desc = "display hover information"})
map("n", "<leader>ld", vim.lsp.buf.definition, {desc = "display definition"})
map("n", "<leader>la", vim.lsp.buf.code_action, {desc = "lsp code actions"})

-- more convenient window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- buffer commands
map("n", "<tab>", "<cmd>bnext<CR>", { desc = "buffer goto next" })
map("n", "<S-tab>", "<cmd>bprev<CR>", { desc = "buffer goto prev" })
map("n", "<leader>x", "<cmd>bdelete<CR>", {desc = "delete buffer"})
map("n", "<leader>n", "<cmd>tabnew<CR>", {desc = "new buffer"})

-- telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {desc = "telescope find files"})
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {desc = "telescope live grep"})
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", {desc = "telescope recent files"})
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {desc = "telescope help_tags"})

-- formating
map("n", "<leader>lf", vim.lsp.buf.format, {desc = "format file"})

--numbers
map("n", "<leader>rn", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rr", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- nvim tree
map("n", "<c-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- hop utility
map("n", "<leader>hw", "<cmd>HopWord<CR>", {desc = "hop to word"})
map("n", "<leader>hl", "<cmd>HopLine<CR>", {desc = "hop to line"})

-- toggle terminal
map("n", "<leader>t", "<cmd>ToggleTerm<CR>", {desc = "toggle terminal"})
