return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
  },
  config = function()
    require("codesnap").setup({
      border = "rounded",
      has_breadcrumbs = true,
      bg_color = "#535c68",
      watermark = ""
    })
  end,
}
