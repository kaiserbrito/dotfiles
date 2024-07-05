require("mason").setup()
local navic = require("nvim-navic")

require("mason-lspconfig").setup {
  ensure_installed = {
    "html",
    "jsonls",
    "solargraph",
    "lua_ls",
    "tsserver",
    "yamlls",
  },
}

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason_null_ls.setup {
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "eslint_d",      -- ts/js linter
    "prettier",      -- ts/js formatter
    "rubocop",       -- ruby
    "stylua",        -- lua formatter
    "yamlfmt",       -- Yaml
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
  automatic_setup = true,
}

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  keymap.set("n", "K", vim.lsp.buf.hover, opts)
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap.set("n", "gr", vim.lsp.buf.references, opts)
  keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

local lspconfig = require "lspconfig"
local get_servers = require("mason-lspconfig").get_installed_servers

for _, server_name in ipairs(get_servers()) do
  lspconfig[server_name].setup {
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
  }
end
