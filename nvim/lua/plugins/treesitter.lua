return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup {
      ensure_installed = {
        "c",
        "ruby",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "html",
        "hcl",
        "scss",
        "lua",
        "bash",
        "fish",
        "go",
        "elixir",
        "javascript",
        "vim",
        "vimdoc",
      },
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      autopairs = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = {
          "ruby"
        },
      },
      autotag = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
    }
  end,
}
