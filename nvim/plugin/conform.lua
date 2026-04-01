vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  notify_on_error = true,
  formatters_by_ft = {
    javascript = { "prettierd", "prettier", stop_after_first = true },
    ruby = { "rubocop" },
    eruby = { "erb_format" },
  },
  formatters = {
    rubocop = {
      command = "bundle",
      args = { "exec", "rubocop", "-A", "--stderr", "--stdin", "$FILENAME" },
    },
  },
})

vim.keymap.set("", "<leader>f", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
