let vimdir = '~/.config/nvim/'
let was_installed = 1

if !filereadable(expand(vimdir . "autoload/plug.vim"))
  call system('curl -fLo ' . vimdir . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.
  execute 'source ' . vimdir . 'autoload/plug.vim'
  let was_installed = 0
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': 'TSUpdate' }
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-git'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'janko-m/vim-test'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript', { 'for': ['javascript']}
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()
