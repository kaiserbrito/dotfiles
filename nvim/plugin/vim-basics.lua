vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons", version = vim.version.range("*") },
  "https://github.com/tpope/vim-sleuth",
  "https://github.com/AndrewRadev/splitjoin.vim",
  { src = "https://github.com/nvim-mini/mini.surround", version = vim.version.range("*") },
  "https://github.com/tpope/vim-abolish",
  { src = "https://github.com/nvim-mini/mini.pairs", version = vim.version.range("*") },
  { src = "https://github.com/nvim-mini/mini.hipatterns", version = vim.version.range("*") },
  { src = "https://github.com/nvim-mini/mini.ai", version = vim.version.range("*") },
  "https://github.com/vim-test/vim-test",
  "https://github.com/tpope/vim-rails",
})

-- mini.icons setup with web-devicons mocking
require("mini.icons").setup()
package.preload["nvim-web-devicons"] = function()
  require("mini.icons").mock_nvim_web_devicons()
  return package.loaded["nvim-web-devicons"]
end

-- mini.surround setup
require("mini.surround").setup()

-- mini.pairs setup
require("mini.pairs").setup()

-- mini.hipatterns setup
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- mini.ai setup
require("mini.ai").setup()

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
