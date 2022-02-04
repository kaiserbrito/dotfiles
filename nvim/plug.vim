let vimdir = '~/.config/nvim/'
let was_installed = 1

if !filereadable(expand(vimdir . "autoload/plug.vim"))
  call system('curl -fLo ' . vimdir . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source ' . vimdir . 'autoload/plug.vim'
  let was_installed = 0
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'sainnhe/gruvbox-material'
" Plug 'morhetz/gruvbox'
" Plug 'EdenEast/nightfox.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'onsails/lspkind-nvim'
" Completion
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'blueyed/vim-diminactive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-git'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rails'
Plug 'windwp/nvim-autopairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'andymass/vim-matchup'
Plug 'alvarosevilla95/luatab.nvim'

Plug 'startup-nvim/startup.nvim'
Plug 'preservim/vimux'

call plug#end()
