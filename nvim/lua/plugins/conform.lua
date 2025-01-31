return {
  "stevearc/conform.nvim",
  lazy = false,
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
    rubocop = {
      command = "bundle exec",
      args = { "-A", "$FILENAME" },
    },
  },
}
