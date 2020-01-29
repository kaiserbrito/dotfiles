let vimdir = '~/.config/nvim/'
let was_installed = 1

if !filereadable(expand(vimdir . "autoload/plug.vim"))
  call system('curl -fLo ' . vimdir . 'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  execute 'source ' . vimdir . 'autoload/plug.vim'
  let was_installed = 0
endif

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
"Ack
Plug 'mileszs/ack.vim'
" Git
Plug 'tpope/vim-fugitive'
" Editor Config
Plug 'editorconfig/editorconfig-vim'
" Show lines changed
Plug 'airblade/vim-gitgutter'
" Display indent steps
Plug 'Yggdroot/indentLine'
" Comment in/out stuff easily
Plug 'tomtom/tcomment_vim'
" Unix stuff, including editing things with sudo
Plug 'tpope/vim-eunuch'
" Add end to ruby blocks automatically
Plug 'tpope/vim-endwise'
" Easily change delimiters
Plug 'tpope/vim-surround'
" Heuristically adjust shiftwidth and expandtab
Plug 'tpope/vim-sleuth'
" Highlight colors
Plug 'ap/vim-css-color'
" Many handy text objects
Plug 'wellle/targets.vim'
" Make . work with surround (and other plugins)
Plug 'tpope/vim-repeat'
" Readline key bindings.
Plug 'tpope/vim-rsi'
" Useful toggling mappings
Plug 'tpope/vim-unimpaired'
" Auto close pairs
Plug 'jiangmiao/auto-pairs'
" Multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Change background of inactive windows
Plug 'blueyed/vim-diminactive'
"whitespace
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
"Plug 'justinmk/vim-dirvish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" https://github.com/junegunn/fzf#as-vim-plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" JS highlighting and indent support. Sometimes buggy, but has support for
" " jsdocs and flow
Plug 'pangloss/vim-javascript', { 'for': ['javascript']}
"buffer files
Plug 'Shougo/denite.nvim'

Plug 'Shougo/echodoc.vim'
"rubocop
Plug 'ngmy/vim-rubocop'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-git'
" splitjoin
Plug 'AndrewRadev/splitjoin.vim'
"rails
Plug 'tpope/vim-rails'
" test
Plug 'janko-m/vim-test'
" using ctrl + h/j/k/l on tmux
Plug 'christoomey/vim-tmux-navigator'
"
" Plug to resolve git merge conflict
Plug 'christoomey/vim-conflicted'

" Snow Theme
Plug 'nightsense/snow'
" Material Theme
Plug 'kaicataldo/material.vim'
  " CtrlSF
Plug 'dyng/ctrlsf.vim'
" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'APZelos/blamer.nvim'
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
let g:ale_ruby_solargraph_executable = 'solargraph'

" use rubocop
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['jshint']
\}

let g:ale_linters = {
\   'ruby': ['rubocop', 'solargraph'],
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

let test#ruby#rspec#executable = 'rspec'

" Blamer config
let g:blamer_enabled = 1
let g:blamer_delay = 500
let g:blamer_date_format = '%d/%m/%y'
highlight Blamer guifg=darkgrey

so ~/.config/nvim/mappings.vim
