return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_transparent_background = 2
    vim.g.gruvbox_material_dim_inactive_windows = 1
    vim.g.gruvbox_material_float_style = "dim"
    vim.cmd.colorscheme("gruvbox-material")
  end
}
