local M = {}

function M.config()
  local status_ok, tokyonight = pcall(require, "tokyonight")
  if not status_ok then
    return
  end

  tokyonight.setup({
    style = "night",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = "italic",
      keywords = "italic",
      functions = "NONE",
      variables = "NONE",
      sidebars = "dark",
      floats = "dark",
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    hide_inactive_statusline = true,
    dim_inactive = true,
    lualine_bold = false,
  })

  vim.cmd "colorscheme tokyonight"
end

return M
