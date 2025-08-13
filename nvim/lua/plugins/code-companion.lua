return {
  "olimorris/codecompanion.nvim",
  opts = {
    log_level = "DEBUG",
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          model = "gpt-4.1",
        },
      },
      inline = {
        adapter = {
          name = "copilot",
          model = "gpt-4.1",
        },
      },
      cmd = {
        adapter = {
          name = "copilot",
          model = "gpt-4.1",
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
