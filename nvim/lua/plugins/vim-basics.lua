return {
  { "tpope/vim-sleuth" },
  { "AndrewRadev/splitjoin.vim" },
  {
    "echasnovski/mini.bufremove",
    config = function ()
      vim.api.nvim_set_keymap("n", "Q", "<cmd>lua require('mini.bufremove').delete(0, false)<CR>", {})
    end,
  },
  { "tpope/vim-surround" },

  { "tpope/vim-abolish" },

  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  {
    "vim-test/vim-test",
    config = function ()
      vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>TestNearest<CR>", { noremap = true, silent = true})
      vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>TestFile<CR>", { noremap = true, silent = true})
      vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>TestLast<CR>", { noremap = true, silent = true})

      vim.cmd([[ let test#strategy = "neovim_sticky" ]])
    end,
  },

  {
    "tpope/vim-rails",
    config = function ()
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
    end,
  },
}
