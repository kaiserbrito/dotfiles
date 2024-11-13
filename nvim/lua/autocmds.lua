vim.api.nvim_create_autocmd({"FocusLost", "BufLeave", "WinLeave"}, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! wa")
  end,
})
