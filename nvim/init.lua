-- PackChanged hooks (must be defined BEFORE any vim.pack.add() call)
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    -- TSUpdate hook for nvim-treesitter
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end

    if name == 'codesnap.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('codesnap.nvim') end
      local plugin_path = vim.fn.stdpath('data') .. '/site/pack/core/opt/codesnap.nvim'
      local ok_fetch, fetch = pcall(require, 'codesnap.fetch')
      if ok_fetch then
        local ok_lib, lib_path = pcall(fetch.ensure_lib)
        if ok_lib and lib_path and vim.fn.filereadable(lib_path) == 1 then
          vim.fn.system({ 'cp', '-f', lib_path, plugin_path .. '/lua/generator.so' })
        end
      end
    end
  end
})

-- Core requires (plugin/ directory auto-sources remaining plugins alphabetically)
require("options")
require("mappings")
require("autocmds")
