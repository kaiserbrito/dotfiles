vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>TestNearest -fp<CR>', { noremap = true, silent = true}) -- Test nearest test
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>TestFile -fp<CR>', { noremap = true, silent = true}) -- Test file
vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>TestLast -fp<CR>', { noremap = true, silent = true}) -- Test last test run

vim.cmd([[ let test#strategy = "neovim_sticky" ]])
