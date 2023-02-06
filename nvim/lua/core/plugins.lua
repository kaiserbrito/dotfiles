-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  -- Colorscheme
  use({
    "catppuccin/nvim",
    as = "catppuccin",
  })

  use("preservim/vimux") -- Run tests in another tmux pane
  use({
    "aserowy/tmux.nvim",
    config = function ()
      require("tmux").setup()
    end
  })

  use("numToStr/Comment.nvim") -- commenting with gc

  use("AndrewRadev/splitjoin.vim")

  use("kyazdani42/nvim-web-devicons")

  use({ "akinsho/bufferline.nvim" })

  use("moll/vim-bbye") -- Delete buffers

  use({ "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" }) -- file explorer

  use("nvim-lualine/lualine.nvim") -- statusline

  -- Syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = {
      {
        -- Parenthesis highlighting
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter"
      },
      {
        -- Autoclose tags
        "windwp/nvim-ts-autotag",
        after = "nvim-treesitter"
      },
    },
  })

  -- auto closing
  use({ "windwp/nvim-autopairs" })

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use({
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function ()
      require("lspsaga").setup({})
    end
  })
  -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim" }) -- fuzzy finder

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  -- Essential plugins
  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  use("vim-test/vim-test") -- Run tests on neovim
  use("tpope/vim-rails") -- Rails
  use("tpope/vim-abolish")
  use("numToStr/FTerm.nvim") -- Terminal
  use("folke/which-key.nvim") -- Keymaps popup
  use("karb94/neoscroll.nvim") -- Smooth scrolling
  use("narutoxy/silicon.lua") -- Better screenshot

  if packer_bootstrap then
    require("packer").sync()
  end
end)
