return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = "copilot",
    provides = {
      copilot = {
        model = "gpt-4.1-copilot",
        timeout = 30000,
        temperature = 0,
        max_completion_tokens = 8192,
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
