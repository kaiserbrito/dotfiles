return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  keys = {
    {
      "<leader>iC",
      "<CMD>Copilot toggle<CR>",
      desc = "Copilot: Toggle",
    },
  },
  opts = {
    panel = {
      enable = true,
    },
    suggestion = {
      enabled = true,
      auto_trigger = false,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<C-a>",
        accept_word = "<C-i>",
        accept_line = false,
        next = "<C-n>",
        prev = "<C-p>",
        dismiss = "<C-Esc>",
      },
    },
    filetypes = {
      yaml = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
  },
}
