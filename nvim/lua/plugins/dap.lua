return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("dapui").setup()

      vim.fn.sign_define(
        "DapBreakpoint", {
          text = "🔴",
          texthl = "DapBreakpoint",
          linehl = "DapBreakpoint",
          numhl = "DapBreakpoint",
        }
      )
      vim.api.nvim_set_keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
      vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })
    end,
  },

  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },
}
