set backspace=2   	" backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler         	" show the cursor position all the time
set showcmd       	" display incomplete commands
set incsearch     	" do incremental searching
set laststatus=2  	" always display the status line
set autowrite     	" automatically :write before running commands
set number
set nowrap              " wrap long lines
set cursorline
set encoding=utf8
set showmatch           " show matching brackets/parenthesis
set nojoinspaces 	" Use one space, not two, after punctuation.
set nocompatible        " be iMproved, required
set hlsearch		" highlight search
set smartindent
set autoindent		" auto indentation

filetype indent on  	" load indent file for the current filetype

" install fonts from https://github.com/ryanoasis/nerd-fonts
" set guifont=UbuntuMono\ Nerd\ Font\ Mono\ 12
" set guifont=Inconsolata\ 12
set guifont=Inconsolata\ Nerd\ Font\ Mono\ 12

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set number " show line numbers in vim
set numberwidth=5
set relativenumber " show relative line numbers

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-c> bd		" close current buffer:

" Map spacebar to :
nno <Space> :
vno <Space> :

" Moving between buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Make it obvious where 80 characters is
set textwidth=100
set colorcolumn=+1

filetype off


syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" let Vundle manage Vundle, required
call vundle#begin()

" Plugins
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-characterize'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdtree'
Plugin 'thoughtbot/vim-rspec'
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ryanoasis/vim-devicons'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'SirVer/ultisnips'
Plugin 'FuzzyFinder'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'honza/vim-snippets'
Plugin 'Supertab'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'easymotion/vim-easymotion'
Plugin 'elzr/vim-json'
Plugin 'vim-syntastic/syntastic'
Plugin 'maxbrunsfeld/vim-yankstack'
" Material Theme
Plugin 'kaicataldo/material.vim'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:airline_theme='luna'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

call vundle#end()             		" All pugins must be added before this line

filetype plugin indent on

syntax on

" Solarized colorscheme
colorscheme material
" NERDTree
let g:NERDTreeMouseMode = 3		" single-click to open folders
let g:NERDTreeShowHidden=1		" show hidden files

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" CtrlP Plugin config
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0
let g:ctrlp_root_directory = "~/Documents"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

imap jk <Esc>		" use jk as an ESC replacement

" Yankstack config
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
