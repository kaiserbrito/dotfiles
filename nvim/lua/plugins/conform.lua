return {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format { async = true, lsp_format = "fallback" }
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
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
  },
  init = function ()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
