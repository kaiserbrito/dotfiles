" Disabling arrow keys
noremap <Left> :echoe "Use h"<CR>
noremap <Right> :echoe "Use l"<CR>
noremap <Up> :echoe "Use k"<CR>
noremap <Down> :echoe "Use j"<CR>

" Tabs
nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
nmap <C-T> :tabnew<Return>

" Auto format any pasted text
nnoremap P P=`]
nnoremap p p=`]

" Copy filepath
nmap <Leader>cs :let @+=fnamemodify(expand("%"), ":~:.")<CR>

" Replace all :
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap 0 ^
nnoremap ^ 0

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" ============================
" SplitJoin plugin
" ============================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" ============================
" Nvim Tree
" ============================
nnoremap ,l :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" ============================
" Rails
" ============================
nnoremap <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>l :TestLast<CR>

" Insert Mode
iabbr bp binding.pry

" Debugger in JS
iabbr dbg debugger;

" Set Trace python
iabbr pdb import pdb; pdb.set_trace()

" Frozen comment in Ruby files
iabbr fsl # frozen_string_literal: true
