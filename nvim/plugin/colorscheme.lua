vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
  transparent_background = true,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
})

vim.cmd("colorscheme catppuccin-macchiato")
