local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Disabling arrow keys
map("n", "<Left>", ":echoe 'Use h'<CR>", opts)
map("n", "<Right>", ":echoe 'Use l'<CR>", opts)
map("n", "<Up>", ":echoe 'Use k'<CR>", opts)
map("n", "<Down>", ":echoe 'Use j'<CR>", opts)

-- Replace to better go to the beginning of the line
map("n", "0", "^", opts)
map("n", "^", "0", opts)

-- Copy filepath
map("n", "<leader>cs", ":let @+=fnamemodify(expand('%'), ':~:.')<CR>", opts)

-- Terminal
map("t", "<Esc><Esc>", [[<C-\><C-n><C-w>]], opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Navigate buffers
map("n", "bj", "<cmd>bfirst<CR>", opts)
map("n", "bl", "<cmd>bnext<CR>", opts)
map("n", "bk", "<cmd>blast<CR>", opts)
map("n", "bh", "<cmd>bprevious<CR>", opts)

-- LSP
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show Docs" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Check references" })
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", { desc = "Format" })

vim.cmd [[iabbr bp binding.pry]]
