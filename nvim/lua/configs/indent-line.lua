local M = {}

function M.config()
  local status_ok, indent_blankline = pcall(require, "indent_blankline")
  if not status_ok then
    return
  end

  vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:↴"

  vim.g.indent_blankline_filetype_exclude = {
    "help",
    "startify",
    "neogitstatus",
    "NvimTree",
    "Trouble",
  }

  indent_blankline.setup {
    show_end_of_line = false,
    space_char_blankline = " ",
  }
end

return M
