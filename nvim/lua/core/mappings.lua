local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Close buffer
map("n", "Q", "<cmd>lua require('mini.bufremove').delete(0, false)<CR>", opts)
-- Close all buffers but the current
map("n", "<leader>o", ":%bd|e#|bd#<CR>", opts)

-- Split windows
map("n", "vv", "<C-w>v", opts)
map("n", "ss", "<C-w>s", opts)

-- Gitsigns
map("n", "<leader>j", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
map("n", "<leader>k", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
-- Actions
map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", opts)
map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", opts)
map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", opts)
map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', opts)
map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", opts)

-- Fugitive
map("n", "<leader>gt", "<cmd>Gedit :<CR>", opts)
map("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>", opts)
map("n", "<leader>gb", "<cmd>Git blame<CR>", opts)
map("n", "<leader>gl", "<cmd>Git log<CR>", opts)
map("n", "gdh", "<cmd>diffget //2<CR>", opts)
map("n", "gdl", "<cmd>diffget //3<CR>", opts)

-- Clear search highlight
map("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

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

-- Resize with arrows
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", opts)

-- Telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
map("n", "<leader>fr", "<cmd>Telescope registers<CR>", opts)

-- Trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", opts)

-- Navbuddy
map("n", "<leader>nb", "<cmd>lua require('nvim-navbuddy').open()<CR>", opts)

-- Comment
map("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
map("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

-- Terminal
map("n", "<C-\\>", "<cmd>terminal<CR>", opts)
map("n", "<leader>lg", "<cmd>terminal lazygit<CR>", opts)
map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

-- Markdown Preview
map("n", "<leader>mp", "<Plug>MarkdownPreview", opts)

-- Treesitter context
map("n", "[c", "<cmd>lua require('treesitter-context').go_to_context()<CR>", opts)

-- Neorg
map("n", "<leader>no", "<cmd>Neorg index<CR>", opts)
map("n", "<leader>nr", "<cmd>Neorg return<CR>", opts)
map("n", "<leader>nt", "<cmd>Neorg toggle-concealer<CR>", opts)

-- Spectre
map("n", "<leader>s", "<cmd>lua require('spectre').toggle()<CR>", opts)
map("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({ select_word=true })<CR>", opts)
map("v", "<leader>sw", "<cmd>lua require('spectre').open_visual()<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("v", "<A-k>", "<cmd>m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
map("x", "J", "<cmd>move '>+1<CR>gv-gv", opts)
map("x", "K", "<cmd>move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
