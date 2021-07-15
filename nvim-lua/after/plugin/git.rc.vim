" git gutter hunk movements
nmap <leader>j <Plug>(GitGutterNextHunk)
nmap <leader>k <Plug>(GitGutterPrevHunk)

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
