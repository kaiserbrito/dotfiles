return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "html",
        "jsonls",
        "lua_ls",
        "ruby_lsp",
        "tailwindcss",
        "taplo",
        "ts_ls",
        "expert",
      },
    },
  }
}
