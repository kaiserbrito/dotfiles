return {
  "nvim-pack/nvim-spectre",
  event = "VeryLazy",
  config = function()
    require("spectre").setup()

    local set_keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    set_keymap('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
      desc = "Toggle Spectre"
    }, opts)

    set_keymap('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
      desc = "Search current word"
    }, opts)

    set_keymap('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
      desc = "Search current word"
    }, opts)

    set_keymap('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
      desc = "Search on current file"
    }, opts)
  end
}
