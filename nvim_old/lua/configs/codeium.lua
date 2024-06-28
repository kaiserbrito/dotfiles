vim.cmd [[
  let g:codeium_enabled = v:false
]]

vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
