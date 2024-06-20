local status_ok, terminal = pcall(require, "toggleterm")
if not status_ok then
  return
end

terminal.setup {
  size = 40,
}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new { cmd = "lazygit", hidden = true }

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>lg",
  "<cmd>lua _LAZYGIT_TOGGLE()<CR>",
  { noremap = true, silent = true }
)
