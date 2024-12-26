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

vim.cmd [[iabbr bp binding.pry]]
