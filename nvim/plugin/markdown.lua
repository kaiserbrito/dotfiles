-- Lazy loaded on markdown filetype
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/MeanderingProgrammer/render-markdown.nvim"
    })
    
    require("render-markdown").setup({
      file_types = { "markdown" },
    })
  end
})
