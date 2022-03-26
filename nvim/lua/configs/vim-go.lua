vim.cmd([[
  autocmd FileType go setlocal shiftwidth=4 tabstop=4
  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
]])
