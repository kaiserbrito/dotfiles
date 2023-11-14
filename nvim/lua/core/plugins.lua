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
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  { "aserowy/tmux.nvim" },

  { "numToStr/Comment.nvim" }, -- commenting with gc

  { "AndrewRadev/splitjoin.vim" },

  { "kyazdani42/nvim-web-devicons" },

  { "akinsho/bufferline.nvim", event = "VeryLazy" },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", event = "VeryLazy" }, -- Indentation guides

  { "echasnovski/mini.bufremove" }, -- Delete buffers

  { "nvim-tree/nvim-tree.lua" },

  { "stevearc/oil.nvim" },

  { "nvim-lualine/lualine.nvim" }, -- statusline

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- Context
  { "nvim-treesitter/nvim-treesitter-context" },

  -- auto closing
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },

  -- LSP Support
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    build = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- snippets
  { "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
  { "rafamadriz/friendly-snippets" }, -- useful snippets

  -- autocompletion
  { "hrsh7th/cmp-buffer" }, -- source for text in buffer
  { "hrsh7th/cmp-path" }, -- source for file system paths
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },

  -- formatting & linting
  { "nvimtools/none-ls.nvim" }, -- configure formatters & linters
  { "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls

  -- enhanced lsp uis
  { "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion

  -- fuzzy finding w/ telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  { "folke/trouble.nvim", event = "BufRead" },

  -- git integration
  { "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side
  { 'tpope/vim-fugitive' },
  { "Exafunction/codeium.vim" },

  -- Essential plugins
  { "tpope/vim-surround" }, -- add, delete, change surroundings (it's awesome)
  { "vim-test/vim-test" }, -- Run tests on neovim
  { "tpope/vim-rails" }, -- Rails
  { "tpope/vim-abolish" },
  -- Keymaps popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  { "karb94/neoscroll.nvim" }, -- Smooth scrolling

  { "SmiteshP/nvim-navic" },

  {
    "iamcco/markdown-preview.nvim",
    event = "BufRead",
    build = ":call mkdp#util#install()",
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  {
    "vidocqh/data-viewer.nvim",
    opts = {},
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "ThePrimeagen/harpoon", event = "VeryLazy", opts = {} },
}
