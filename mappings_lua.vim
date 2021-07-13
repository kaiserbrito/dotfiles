" Disabling arrow keys
noremap <Left> :echoe "Use h"<CR>
noremap <Right> :echoe "Use l"<CR>
noremap <Up> :echoe "Use k"<CR>
noremap <Down> :echoe "Use j"<CR>

nmap <S-Tab> :tabprevious <CR>

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
" nno <Space> :
" vno <Space> :

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

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>--ruby<Space>--js<Space>


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

" Telescope
nnoremap <C-p> :lua require('telescope.builtin').find_files()<cr>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" LSP

set completeopt=menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

fun! LspLocationList()
  " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
endfun

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>

augroup VICTOR_LSP
  autocmd!
  autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
augroup END

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

inoremap <silent><expr> <CR>      compe#confirm('<CR>')
