return {
  {
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("gitsigns").setup {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          follow_files = true,
        },
        auto_attach = true,
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      }

      vim.api.nvim_set_keymap("n", "<leader>j", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
      vim.api.nvim_set_keymap("n", "<leader>k", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
      vim.api.nvim_set_keymap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", {})
      vim.api.nvim_set_keymap("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", {})
      vim.api.nvim_set_keymap("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", {})
      vim.api.nvim_set_keymap("v", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>hd", ":Gitsigns diffthis<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>', {})
    end,
  },

  {
    "tpope/vim-fugitive",
    config = function ()
      vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Git blame<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Gvdiffsplit!<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>gdh", ":diffget //2<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>gdl", ":diffget //3<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Gedit :<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Git commit<CR>", {})
      vim.api.nvim_set_keymap("n", "<leader>gP", "<cmd>Git! push<CR>", {})
    end,
  },
}
