return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- posible values: night, storm, day and moon
    require("tokyonight").setup({
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      plugins = {
        auto = true,
        all = false,
        ["indent-blankline.nvim"] = true,
      },
      dim_inactive = true,
      hide_inactive_statusline = true,
    })
    vim.cmd.colorscheme("tokyonight-moon")
  end,
}
