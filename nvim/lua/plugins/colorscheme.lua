return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      integrations = {
        cmp = true,
        diffview = true,
        fzf = true,
        harpoon = true,
        lsp_trouble = true,
        mason = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        noice = true,
        notify = true,
        treesitter = true,
        which_key = true,
      },
    })

    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
