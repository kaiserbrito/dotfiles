vim.cmd [[
  augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
  augroup end
]]

vim.cmd 'autocmd BufRead,BufNewFile *.ex,*.exs,mix.lock set filetype=elixir'
vim.cmd 'autocmd BufRead,BufNewFile *.rb,*.rake,Gemfile.lock,Gemfile,*.erb,*.haml set filetype=ruby'
vim.cmd 'autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=4'
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

vim.cmd [[
  " auto save 
  autocmd FocusLost * silent! wa
  autocmd BufLeave * silent! wa
  autocmd WinLeave * silent! wa
]]

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.cmd [[
  command! -nargs=0 LinkBuild :!npm run link:build
]]
