return {
  "nvim-lualine/lualine.nvim",
  config = function ()
  require("lualine").setup {
    options = {
      theme = "auto",
      globalstatus = true,
      component_sepators = "|",
      section_separators = { left = "", right = "" },
      disabled_filetypes = { statusline = { "dashboard", "alpha" } },
    },
    sections = {
      lualine_a = {
         { "mode", separator = { left = "" }, right_padding = 2 },
      },
      lualine_b = {
        { "branch", separator = { right = "" }, left_padding = 2 },
      },
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = " ",
            warn = " ",
            hint = " ",
            info = " ",
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
      },
      lualine_x = {
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
        },
      },
      lualine_y = {
        { "progress", separator = { left = "" }, left_padding = 2 },
      },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    extensions = { "nvim-tree" },
  }
  end,
}
