local M = {}

function M.config()
  local status_ok, catppuccin = pcall(require, "catppuccin")
  if not status_ok then
    return
  end

  catppuccin.setup({
    transparent_background = false,
    term_colors = false,
    compile = {
      enabled = false,
      path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
      dashboard = true,
      gitsigns = true,
      lsp_saga = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      ts_rainbow = true,
      which_key = true,
    },
    color_overrides = {},
    highlight_overrides = {},
  })

  vim.g.catppuccin_flavour = "mocha"
  vim.cmd "colorscheme catppuccin"
end

return M
