vim.pack.add({ "https://github.com/mistricky/codesnap.nvim" })

require("codesnap").setup({
  border = "rounded",
  has_breadcrumbs = true,
  bg_color = "#535c68",
  watermark = ""
})

vim.keymap.set("x", "<leader>cc", "<cmd>CodeSnap<cr>", { desc = "Save selected code snapshot into clipboard" })
