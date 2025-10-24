-- Simple mapping file
local map = vim.keymap.set

-- LSP keymaps (buffer-local, set when LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }
    map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, {desc = "jump to definition"}))
    map("n", "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {desc = "lsp code actions"}))
    map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend("force", opts, {desc = "format file"}))
  end,
})

-- Dooing (to-do) keymaps
map("n", "<leader>td", "<cmd>Dooing<CR>", { desc = "open global todos" })
map("n", "<leader>tD", "<cmd>DooingLocal<CR>", { desc = "open project todos" })

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, {desc = "open diagnostic quickfix list"})
map("n", "[d", function() vim.diagnostic.jump({count = -1}) end, {desc = "go to previous diagnostic"})
map("n", "]d", function() vim.diagnostic.jump({count = 1}) end, {desc = "go to next diagnostic"})

-- more convenient window navigation
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Comment plugin
map("n", "gcc", function()
  return vim.v.count == 0
    and "<Plug>(comment_toggle_linewise_current)"
    or "<Plug>(comment_toggle_linewise_count)"
end, { expr = true, desc = "toggle comment line" })
-- Annoyingly inconsistent but comment.nvim still uses the older plug pattern
map("n", "gc", "<Plug>(comment_toggle_linewise)", { desc = "toggle comment linewise" })
map("x", "gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "toggle comment linewise (visual)" })

-- Buffer commands
map("n", "<tab>", "<cmd>bnext<CR>", { desc = "buffer goto next" })
map("n", "<S-tab>", "<cmd>bprev<CR>", { desc = "buffer goto prev" })
map("n", "<leader>x", "<cmd>bdelete<CR>", {desc = "delete buffer"})
map("n", "<leader>n", "<cmd>tabnew<CR>", {desc = "new buffer"})

-- Git keymaps
map("n", "<leader>gg", function() require("snacks").lazygit() end, {desc = "open lazygit"})
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", {desc = "toggle git blame"})
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", {desc = "preview git hunk"})
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", {desc = "reset git hunk"})
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", {desc = "stage git hunk"})
map("n", "]c", "<cmd>Gitsigns next_hunk<CR>", {desc = "next git hunk"})
map("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", {desc = "previous git hunk"})

-- Telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {desc = "telescope find files"})
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {desc = "telescope live grep"})
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", {desc = "telescope recent files"})
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", {desc = "telescope help_tags"})
map("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", {desc = "telescope file browser"})
map("n", "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", {desc = "telescope file browser current buffer"})
