vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Use nvim-treesitter for parser installation only
-- Features (highlight, indent, fold) must be enabled manually

local languages = {
  "c",
  "ruby",
  "typescript",
  "tsx",
  "json",
  "yaml",
  "html",
  "hcl",
  "scss",
  "lua",
  "bash",
  "fish",
  "go",
  "elixir",
  "javascript",
  "vim",
  "vimdoc",
  "markdown",
  "markdown_inline",
  "query",
}

-- Defer setup to ensure nvim-treesitter is loaded
vim.defer_fn(function()
  -- Ensure nvim-treesitter is loaded
  vim.cmd.packadd('nvim-treesitter')

  -- Install parsers if needed
  local ok, ts = pcall(require, "nvim-treesitter")
  if ok then
    -- Ensure all parsers are installed
    ts.install(languages)
  else
    vim.notify("Failed to load nvim-treesitter: " .. tostring(ts), vim.log.levels.WARN)
  end
end, 100)

-- Enable treesitter highlighting for all configured languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function()
    -- Start treesitter highlighting for this buffer
    vim.treesitter.start()

    -- Enable treesitter-based folding (disabled by default, but ready for manual use)
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldenable = false

    -- Enable treesitter-based indentation (disable for ruby due to issues)
    if vim.bo.filetype ~= "ruby" then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
