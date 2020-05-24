let vimdir = '~/.config/nvim/'
let was_installed = 1

if !filereadable(expand(vimdir . "autoload/plug.vim"))
  call system('curl -fLo ' . vimdir . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source ' . vimdir . 'autoload/plug.vim'
  let was_installed = 0
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-ruby/vim-ruby'
"Ack
Plug 'mileszs/ack.vim'
" Git
Plug 'tpope/vim-fugitive'
" Show lines changed
Plug 'airblade/vim-gitgutter'
" Comment in/out stuff easily
Plug 'tomtom/tcomment_vim'
" Add end to ruby blocks automatically
Plug 'tpope/vim-endwise'
" Heuristically adjust shiftwidth and expandtab
Plug 'tpope/vim-sleuth'
" Make . work with surround (and other plugins)
Plug 'tpope/vim-repeat'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Change background of inactive windows
Plug 'blueyed/vim-diminactive'
"whitespace
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" https://github.com/junegunn/fzf#as-vim-plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-git'
" splitjoin
Plug 'AndrewRadev/splitjoin.vim'
" test
Plug 'janko-m/vim-test'
" using ctrl + h/j/k/l on tmux
Plug 'christoomey/vim-tmux-navigator'
"
" Snow Theme
Plug 'nightsense/snow'
" Material Theme
Plug 'kaicataldo/material.vim'
" COC vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CtrlSF
Plug 'dyng/ctrlsf.vim'
" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'APZelos/blamer.nvim'
Plug 'mhinz/vim-startify'
Plug 'pangloss/vim-javascript', { 'for': ['javascript']}
"rails
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'wellle/targets.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
call plug#end()

if !was_installed
	PlugInstall
endif

set runtimepath^=~/.vim/plugged/ctrlp.vim

let g:mapleader=","
let mapleader=","

let g:airline_theme='luna'

set autoread
set number
colorscheme material
set t_Co=256
set background=dark
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set cursorline!
set wrap
set textwidth=99
set formatoptions=tcqrn1
set noshiftround
set termguicolors
set lazyredraw
set relativenumber
set hidden
set mouse=a

" Status bar
set laststatus=2

" turn on syntax highlighting
syntax enable
syntax on
" highlight to vim-clojure-static
filetype plugin indent on

" Turn off swap and backup files
set noswapfile
set nobackup
set nowb

" Indentation
set autoindent
set smartindent
set smartcase

" Last line
set showmode
set showcmd

" Share the clipboard outside of macvim
set clipboard+=unnamedplus

" Highlight search results
set hlsearch

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Disable bloated stuff that is on by default.
let g:loaded_2html_plugin = 1
let g:loaded_gzip = 1
let g:loaded_tarPlugin = 1 " May cause problems with fireplace
let g:loaded_zipPlugin = 1
let g:loaded_netrwPlugin = 1

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

"deoplete async-clj-omni config
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" better whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" use rubocop
let g:ale_fixers = {
\   'javascript': ['jshint']
\}

let g:ale_linters = {
\   'javascript': ['jshint']
\}

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" update time to refresh gitgutter
set updatetime=100

" indentLine config
set conceallevel=1
let g:indentLine_conceallevel=1

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
" at deco we use 100
set textwidth=99
set colorcolumn=+1

" angular js configs
let g:angular_source_directory = 'src/scripts'
let g:angular_find_ignore = ['components/', 'node_modules/', 'dist/']

let g:ackprg = "ack-grep -H --nocolor --nogroup --column"

let test#ruby#rspec#executable = 'rspec'

" Blamer config
let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_date_format = '%d/%m/%y'
highlight Blamer guifg=darkgrey

so ~/.config/nvim/mappings.vim
