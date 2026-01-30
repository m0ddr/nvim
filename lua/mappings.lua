local map = vim.keymap.set

-- LSP keymaps (buffer-local, set when LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }
    map("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
    map("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "Go to declaration" })
    map("n", "gi", vim.lsp.buf.implementation, { buffer = args.buf, desc = "Go to implementation" })
    map("n", "gr", vim.lsp.buf.references, { buffer = args.buf, desc = "Show references" })
    map("n", "K", vim.lsp.buf.hover, { buffer = args.buf, desc = "Hover documentation" })
    map("n", "<leader>la", vim.lsp.buf.code_action, { buffer = args.buf, desc = "Code action" })
    map("n", "<leader>lr", vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename symbol" })
    map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { buffer = args.buf, desc = "Format file" })
    map("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = args.buf, desc = "Signature help" })
  end,
})

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Next diagnostic" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })

-- Buffer navigation
map("n", "<tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>n", "<cmd>enew<CR>", { desc = "New buffer" })

-- Git keymaps
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle git blame" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Preview hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
map("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
map("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })

-- Telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", { desc = "File browser" })
map("n", "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "File browser (current dir)" })
map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP references" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>fc", "<cmd>Telescope colorscheme<CR>", { desc = "Colorschemes" })
map("n", "<leader><leader>", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })

-- Quality of life
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
