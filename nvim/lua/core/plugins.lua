local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- add list of plugins to install
require("lazy").setup {
  { "nvim-lua/plenary.nvim" }, -- lua functions that many plugins use

  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin" },

  { "aserowy/tmux.nvim" },

  { "numToStr/Comment.nvim" }, -- commenting with gc

  { "AndrewRadev/splitjoin.vim" },

  { "kyazdani42/nvim-web-devicons" },
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup {
        theme = "doom",
        config = {
          center = {
            {
              icon = " ",
              icon_hl = "Title",
              desc = "Find File           ",
              desc_hl = "String",
              key = "b",
              keymap = "SPC f f",
              key_hl = "Number",
              action = "lua print(2)",
            },
            {
              icon = " ",
              desc = "Find Dotfiles",
              key = "f",
              keymap = "SPC f d",
              action = "lua print(3)",
            },
          },
        },
      }
    end,
  },

  { "akinsho/bufferline.nvim" },

  { "moll/vim-bbye" }, -- Delete buffers

  { "nvim-tree/nvim-tree.lua" },

  { "nvim-lualine/lualine.nvim" }, -- statusline

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        -- Parenthesis highlighting
        "p00f/nvim-ts-rainbow",
        "nvim-treesitter",
      },
      {
        -- Autoclose tags
        "windwp/nvim-ts-autotag",
        "nvim-treesitter",
      },
    },
  },

  -- auto closing
  { "windwp/nvim-autopairs" },

  -- snippets
  { "L3MON4D3/LuaSnip" }, -- snippet engine
  { "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
  { "rafamadriz/friendly-snippets" }, -- useful snippets

  -- autocompletion
  { "hrsh7th/nvim-cmp" }, -- completion plugin
  { "hrsh7th/cmp-buffer" }, -- source for text in buffer
  { "hrsh7th/cmp-path" }, -- source for file system paths
  { "hrsh7th/cmp-nvim-lsp" }, -- for autocompletion

  -- managing & installing lsp servers, linters & formatters
  { "williamboman/mason.nvim" }, -- in charge of managing lsp servers, linters & formatters
  { "williamboman/mason-lspconfig.nvim" }, -- bridges gap b/w mason & lspconfig

  -- formatting & linting
  { "jose-elias-alvarez/null-ls.nvim" }, -- configure formatters & linters
  { "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls

  -- configuring lsp servers
  { "neovim/nvim-lspconfig" }, -- easily configure language servers

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup {}
    end,
  },

  -- enhanced lsp uis
  { "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-telescope/telescope.nvim" },

  { "folke/trouble.nvim", event = "BufRead" },

  -- git integration
  { "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side

  -- Essential plugins
  { "tpope/vim-surround" }, -- add, delete, change surroundings (it's awesome)
  { "vim-test/vim-test" }, -- Run tests on neovim
  { "tpope/vim-rails" }, -- Rails
  { "tpope/vim-abolish" },
  { "akinsho/toggleterm.nvim" }, -- Terminal
  { "folke/which-key.nvim" }, -- Keymaps popup
  { "karb94/neoscroll.nvim" }, -- Smooth scrolling
}
