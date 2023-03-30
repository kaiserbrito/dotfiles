-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local keymap = vim.keymap -- for conciseness

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local navbuddy = require("nvim-navbuddy")
-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap.set("n", "<C-p>", "<cmd>LSoutlineToggle<CR>", opts)
  keymap.set("n", "<space>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  end
  navbuddy.attach(client, bufnr)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local lsp_client = {
  "elixirls",
  "gopls",
  "html",
  "jsonls",
  "solargraph",
  "lua_ls",
  "tsserver",
  "yamlls",
}

for _, value in ipairs(lsp_client) do
  lspconfig[value].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

local saga_status, lspsaga = pcall(require, "lspsaga")
if not saga_status then
  return
end

lspsaga.setup {
  symbol_in_winbar = { enable = false },
  beacon = {
    enable = true,
    frequency = 7,
  },
}
