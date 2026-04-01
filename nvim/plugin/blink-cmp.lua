-- blink.cmp is loaded in init.lua (needed by LSP configs)
-- This file just configures it

require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono"
  },
  fuzzy = { implementation = "lua" },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  cmdline = { enabled = false },
  signature = { enabled = true }
})
