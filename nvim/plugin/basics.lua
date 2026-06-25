vim.pack.add({
  "https://github.com/tpope/vim-sleuth",
  "https://github.com/AndrewRadev/splitjoin.vim",
  "https://github.com/tpope/vim-abolish",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/vim-test/vim-test",
  "https://github.com/tpope/vim-rails",
  { src = "https://github.com/neovim/nvim-lspconfig" },
})


-- vim-test configuration
vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<CR>", { noremap = true, silent = true })
vim.cmd([[ let test#strategy = "neovim_sticky" ]])

-- vim-rails configuration
vim.cmd([[
  let g:rails_projections = {
    \ "app/controllers/*_controller.rb": {
    \   "test": [
    \     "spec/controllers/{}_controller_spec.rb",
    \     "spec/requests/{}_spec.rb"
    \   ],
    \ },
    \ "spec/requests/*_spec.rb": {
    \   "alternate": [
    \     "app/controllers/{}_controller.rb",
    \   ],
    \ }}
]])
