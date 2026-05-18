-- PackChanged hooks (must be defined BEFORE any vim.pack.add() call)
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    -- TSUpdate hook for nvim-treesitter
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end

    -- Build hook for codesnap
    if name == 'codesnap.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('codesnap.nvim') end
      local plugin_path = vim.fn.stdpath('data') .. '/site/pack/core/opt/codesnap.nvim'
      vim.fn.system('cd ' .. vim.fn.shellescape(plugin_path) .. ' && make')
    end

    -- Build hook for blink.cmp
    if name == 'blink.cmp' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('blink.cmp') end
      local plugin_path = vim.fn.stdpath('data') .. '/site/pack/core/opt/blink.cmp'
      vim.fn.system('cd ' .. vim.fn.shellescape(plugin_path) .. ' && cargo build --release')
    end
  end
})

-- Load plugins needed by LSP configs BEFORE require("core.lsp")
vim.pack.add({
  "https://github.com/rafamadriz/friendly-snippets",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") }
})

-- Core requires (plugin/ directory auto-sources remaining plugins alphabetically)
require("core.mason-path")
require("core.lsp")
require("options")
require("mappings")
require("autocmds")
