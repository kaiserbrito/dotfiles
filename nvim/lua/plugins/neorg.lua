return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
          config = {
            workspaces = {
              personal = "~/Documents/notes/personal",
              work = "~/Documents/notes/work",
            },
            default_workspace = "work",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2

    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>no", "<cmd>Neorg index<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>nr", "<cmd>Neorg return<CR>", opts)
    vim.api.nvim_set_keymap("n", "<leader>nt", "<cmd>Neorg toggle-concealer<CR>", opts)
  end,
}
