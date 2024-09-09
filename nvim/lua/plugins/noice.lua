return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
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
        -- throttle = 1000 / 30,
        view = "notify",
      },
      -- override markdown rendering so that **cmp** and other plugins use **treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      --     hover = {enabled = false },
      --     signature = { enabled = false },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "muniftanjim/nui.nvim",
    -- optional:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   if not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
  },
  config = function(_, opts)
    require("noice").setup(opts)

    vim.api.nvim_set_keymap("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true })
  end,
}
