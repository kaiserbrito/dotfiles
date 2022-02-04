if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "ruby",
    "tsx",
    "json",
    "yaml",
    "html",
    "scss",
    "lua",
    "bash",
    "fish",
    "go",
    "elixir"
  },
  matchup = {
    disable = {},
    enable = true,
    module_path = "treesitter-matchup.internal"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
parser_config.ruby.used_by = { "ruby" }
parser_config.go.used_by = { "go" }
parser_config.elixir.used_by = { "elixir" }
EOF
