vim.pack.add({
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim"
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "html",
    "jsonls",
    "lua_ls",
    "ruby_lsp",
    "tailwindcss",
    "taplo",
    "ts_ls",
  },
})
