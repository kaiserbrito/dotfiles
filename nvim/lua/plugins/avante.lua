return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = "copilot",
    auto_suggestions = false,
    providers = {
      copilot = {
        model = "claude-sonnet-3.7",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",  -- for file_selector provider mini.pick
    "echasnovski/mini.icons",
    "zbirenbaum/copilot.lua", -- for providers='copilot'
  },
}
