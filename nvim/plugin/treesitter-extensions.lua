vim.pack.add({
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/andymass/vim-matchup",
  "https://github.com/RRethy/nvim-treesitter-endwise",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
  callback = function()
    pcall(function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end)
  end,
})

vim.g.matchup_matchparen_offscreen = { method = "popup" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ruby", "lua", "vim", "bash", "elixir" },
  callback = function()
    pcall(function()
      require("nvim-treesitter-endwise").setup({})
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ruby", "lua", "vim", "bash", "elixir" },
  callback = function()
    vim.keymap.set("n", "gnn", function()
      vim.cmd("normal! v")
      local ts = vim.treesitter
      local node = ts.get_node()
      if node then
        vim.fn.setpos("'<", { 0, node:start() + 1, 0, 0 })
        vim.fn.setpos("'>", { 0, node:end_() + 1, 0, 0 })
      end
    end, { buffer = true, desc = "Start treesitter incremental selection" })
  end,
})
