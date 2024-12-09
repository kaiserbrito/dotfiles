return {
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  { "tpope/vim-sleuth" },
  { "AndrewRadev/splitjoin.vim" },
  { "tpope/vim-surround" },

  { "tpope/vim-abolish" },

  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },

  {
    "echasnovski/mini.hipatterns",
    version = "*",
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end
  },

  {
    "echasnovski/mini.ai",
    version = "*",
    config = function()
      require("mini.ai").setup()
    end
  },

  {
    "vim-test/vim-test",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>TestNearest<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>TestFile<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>TestLast<CR>", { noremap = true, silent = true })

      vim.cmd([[ let test#strategy = "neovim_sticky" ]])
    end,
  },

  {
    "tpope/vim-rails",
    config = function()
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
