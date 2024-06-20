return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  config = function()
    require("harpoon").setup({})

    vim.api.nvim_set_keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>hq", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", {})
  end,
}
