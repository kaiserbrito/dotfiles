-- Formatting and linting
-- https://github.com/jose-elias-alvarez/null-ls.nvim
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- Check supported formatters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- Check supported linters
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local conditional = function(fn)
  local utils = require("null-ls.utils").make_conditional_utils()
  return fn(utils)
end

null_ls.setup {
  debug = false,
  sources = {
    -- Elixir
    formatting.mix,
    -- JS
    formatting.prettier.with {
      extra_args = { "--single-quote" }
    },
    -- Fish
    formatting.fish_indent,
    -- Go
    diagnostics.golangci_lint,
    formatting.gofmt,
    formatting.goimports,
    -- Ruby
    conditional(function(utils)
      return utils.root_has_file("Gemfile")
          and null_ls.builtins.formatting.rubocop.with({
            command = "bundle",
            args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.formatting.rubocop._opts.args),
          })
          or null_ls.builtins.formatting.rubocop
    end),
    conditional(function(utils)
      return utils.root_has_file("Gemfile")
          and null_ls.builtins.diagnostics.rubocop.with({
            command = "bundle",
            args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.diagnostics.rubocop._opts.args),
          })
          or null_ls.builtins.diagnostics.rubocop
    end),
    -- Terraform
    formatting.terraform_fmt,
    -- Yaml
    formatting.yamlfmt,
    diagnostics.yamllint,
  },
}
