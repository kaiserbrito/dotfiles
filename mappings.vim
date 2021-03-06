" Disabling arrow keys
noremap <Left> :echoe "Use h"<CR>
noremap <Right> :echoe "Use l"<CR>
noremap <Up> :echoe "Use k"<CR>
noremap <Down> :echoe "Use j"<CR>

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <S-Tab> :tabprevious <CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Auto format any pasted text
nnoremap P P=`]
nnoremap p p=`]

" NerdTree keymaps
nmap <silent> <Leader>p :NERDTreeToggle<CR>
nmap <silent> <Leader>l :NERDTreeFind<CR>

" Copy filepath
nmap <Leader>cs :let @+=expand("%")<CR>

" CtrlSF
nmap <Leader>cf <Plug>CtrlSFPrompt
vmap <Leader>cf <Plug>CtrlSFVwordPath

" Easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Replace all :
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Map spacebar to :
nno <Space> :
vno <Space> :

nnoremap <C-p> :GFiles<CR>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

:imap jk <Esc>

"tabs
nnoremap <tab> :tabnext<CR>
nnoremap <C-T> :tabnew<CR>
inoremap <tab> <Esc>:tabnext<CR>i
inoremap <C-T> <Esc>:tabnew<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Grepping made easy
nnoremap <leader>g :Ag <C-R><C-W>
set nohlsearch
nnoremap <leader>h :set hlsearch!<CR>

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
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

" git gutter hunk movements
nmap <leader>j <Plug>(GitGutterNextHunk)
nmap <leader>k <Plug>(GitGutterPrevHunk)

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>--ruby<Space>--js<Space>

" Prettier
vmap <leader>z  <Plug>(coc-format-selected)
nmap <leader>z  <Plug>(coc-format-selected)

" Conflicted
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'
set stl+=%{ConflictedVersion()}

" Terminal integrated with F4
let g:term_buf = 0
function! Term_toggle()
  1wincmd w
  if g:term_buf == bufnr("")
    setlocal bufhidden=hide
    close
  else
    topleft vnew
    try
      exec "buffer ".g:term_buf
    catch
      call termopen("zsh", {"detach": 1 })
      let g:term_buf = bufnr("")
    endtry
    startinsert!
  endif
endfunction
nnoremap <f4> :call Term_toggle()<cr>

" Exit from terminal
:tnoremap <F5> <C-\><C-n>

" Resolve conflicts
nmap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Vim-Fugitive
nmap <leader>gs :Git<CR>
nmap <leader>gb :Git blame<CR>
nmap <leader>ga :Git add .<CR>:bd!<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :Glog
nmap <leader>ge :Gedit<CR>
nmap <leader>gh :Git checkout
nmap <leader>gg :Git pull<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gm :Git checkout master
nmap <leader>gwd :Git diff HEAD .<CR>

" test
map <Leader>tn :TestNearest<CR>
map <Leader>tf :TestFile<CR>
map <Leader>ta :TestSuite<CR>
map <Leader>tl :TestLast<CR>

" vim-test
nmap <leader>t :TestFile<CR>

" Insert Mode
iabbr bp binding.pry

" Debugger in JS
iabbr dbg debugger;

" Set Trace python
iabbr pdb import pdb; pdb.set_trace()

"" Fixer
nmap <F8> :call CocActionAsync('format')<cr>

"" Flake 8 Formatter
autocmd FileType python map <buffer> <F7> :call flake8#Flake8()<CR>

" Remap keys for gotos
nmap <silent> gdd :call CocAction('jumpDefinition', 'drop')<cr>
nmap <silent> gdt :call CocAction('jumpDefinition', 'tab drop')<cr>
nmap <silent> gds :call CocAction('jumpDefinition', 'split')<cr>
nmap <silent> gdv :call CocAction('jumpDefinition', 'vsplit')<cr>
nmap <silent> gr <Plug>(coc-references)

" Automated changes or fixes for an issue
nmap <leader>do <Plug>(coc-codeaction)
