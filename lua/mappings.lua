-- Simple mapping file
local map = vim.keymap.set

-- LSP keymaps
map("n", "<leader>li", vim.lsp.buf.hover, {desc = "display hover information"})
map("n", "<leader>ld", vim.lsp.buf.definition, {desc = "display definition"})
map("n", "<leader>la", vim.lsp.buf.code_action, {desc = "lsp code actions"})
map("n", "<leader>lf", vim.lsp.buf.format, {desc = "format file"})

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, {desc = "open diagnostic quickfix list"})
map("n", "[d", vim.diagnostic.goto_prev, {desc = "go to previous diagnostic"})
map("n", "]d", vim.diagnostic.goto_next, {desc = "go to next diagnostic"})

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

-- format files
map("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "format file" })

-- Git keymaps (add this section to your mappings.lua)
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", {desc = "toggle git blame"})
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", {desc = "preview git hunk"})
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", {desc = "reset git hunk"})
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", {desc = "stage git hunk"})
map("n", "]c", "<cmd>Gitsigns next_hunk<CR>", {desc = "next git hunk"})
map("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", {desc = "previous git hunk"})

-- telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {desc = "telescope find files"})
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {desc = "telescope live grep"})
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", {desc = "telescope recent files"})
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {desc = "telescope help_tags"})
