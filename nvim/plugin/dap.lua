vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/leoluz/nvim-dap-go",
})

require("dapui").setup()

vim.fn.sign_define("DapBreakpoint", {
  text = "🔴",
  texthl = "DapBreakpoint",
  linehl = "DapBreakpoint",
  numhl = "DapBreakpoint",
})

vim.keymap.set("n", "<leader>dt", function() require("dapui").toggle() end, { noremap = true })
vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.keymap.set("n", "<leader>dr", function() require("dapui").open({ reset = true }) end, { noremap = true })
vim.keymap.set("n", "<leader>dbc", ":DapClearBreakpoints<CR>", { noremap = true })

require("dap-go").setup()
