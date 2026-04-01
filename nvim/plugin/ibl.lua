vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.indentscope", version = vim.version.range("*") }
})

require("mini.indentscope").setup()
