return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("rose-pine").setup({
      variant = "moon",    -- auto, main, moon, or dawn
      dark_variant = "main", -- main, moon, or dawn
      dim_inactive_windows = true,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true,        -- Handle deprecated options automatically
      },

      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },
    })

    vim.cmd.colorscheme("rose-pine-moon")
  end,
}
