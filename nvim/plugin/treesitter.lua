vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Defer setup with longer delay and explicit packadd
vim.defer_fn(function()
  -- Ensure treesitter is loaded
  vim.cmd.packadd('nvim-treesitter')

  -- Small additional delay to ensure runtimepath is updated
  vim.defer_fn(function()
    -- Updated to new API: nvim-treesitter.config (without 's')
    local ok, config = pcall(require, "nvim-treesitter.config")
    if not ok then
      vim.notify("Failed to load nvim-treesitter.config: " .. tostring(config), vim.log.levels.ERROR)
      return
    end

    config.setup({
      ensure_installed = {
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
      },
      sync_install = false,
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      autopairs = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = {
          "ruby"
        },
      },
      autotag = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
    })
  end, 50)
end, 100)
