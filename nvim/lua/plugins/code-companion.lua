return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "CodeCompanionChat", "CodeCompanionActions", "CodeCompanion" },
  keys = {
    { "<leader>ac",  "<CMD>CodeCompanionChat<CR>",        desc = "open chat" },
    { "<leader>at",  "<CMD>CodeCompanionChat Toggle<CR>", desc = "toggle chat" },
    { "<leader>ap",  "<CMD>CodeCompanionActions<CR>",     desc = "open copilot palette" },
    { "<leader>as",  "<CMD>CodeCompanion<CR>",            desc = "open inline assistant" },
    { "<leader>aca", "<CMD>CodeCompanionChat Add<CR>",    desc = "add selection to chat" },
  },
  opts = {
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-4.1",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
    display = {
      action_palette = {
        width = 95,
        height = 10,
        prompt = "Prompt ",                   -- Prompt used for interactive LLM calls
        opts = {
          show_default_actions = true,        -- Show the default actions in the action palette?
          show_default_prompt_library = true, -- Show the default prompt library in the action palette?
        },
      },
    },
  },
}
