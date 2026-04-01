vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/NeogitOrg/neogit",
})

require("gitsigns").setup({
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
})

vim.keymap.set("n", "<leader>j", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
vim.keymap.set("n", "<leader>k", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
vim.keymap.set("v", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
vim.keymap.set("n", "<leader>hS", ":Gitsigns stage_buffer<CR>")
vim.keymap.set("n", "<leader>hR", ":Gitsigns reset_buffer<CR>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>")
vim.keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>hd", ":Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>td", ":Gitsigns toggle_deleted<CR>")
vim.keymap.set("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')

require("neogit").setup()

vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open Git diffview" })
