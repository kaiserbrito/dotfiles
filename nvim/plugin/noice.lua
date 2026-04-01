vim.pack.add({
  "https://github.com/muniftanjim/nui.nvim",
  "https://github.com/folke/noice.nvim"
})

require("noice").setup({
  messages = {
    enabled = false
  },
  views = {
    notify = {
      replace = true,
    },
  },
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      view = "notify",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "lsp",
        kind = "",
        find = "Copilot",
      },
      opts = { skip = true },
    },
  },
})

vim.go.lazyredraw = true
vim.keymap.set("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true })
