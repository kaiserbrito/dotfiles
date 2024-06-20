local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Split windows
map("n", "vv", "<C-w>v", opts)
map("n", "ss", "<C-w>s", opts)

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
map("n", "<C-\\>", "<cmd>terminal<CR>", opts)
map("n", "<leader>lg", "<cmd>terminal lazygit<CR>", opts)
map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

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
