-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "elixirls",
    "gopls",
    "html",
    "jsonls",
    "solargraph",
    "sumneko_lua",
    "tsserver",
    "yamlls",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "eslint_d", -- ts/js linter
    "gofmt", -- golang
    "goimports", -- golang
    "mix", -- elixir
    "prettier", -- ts/js formatter
    "rubocop", -- ruby
    "stylua", -- lua formatter
    "terraform_fmt", -- terraform
    "yamlfmt" -- Yaml
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
  automatic_setup = true,
})

mason_null_ls.setup_handlers()
