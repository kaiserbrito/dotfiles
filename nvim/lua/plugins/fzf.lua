return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local fzf = require("fzf-lua")
    local set_keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Files
    set_keymap("n", "<leader>ff", fzf.files, { desc = "[F]ind [F]iles" }, opts)
    set_keymap("n", "<leader>fo", fzf.oldfiles, { desc = "[F]ind [Old] files" }, opts)
    set_keymap("n", "<leader><leader>", fzf.buffers, { desc = "[F]ind existing [B]uffers" }, opts)
    set_keymap("n", "<leader>sn", function()
      fzf.files { cwd = vim.fn.stdpath "config" }
    end, { desc = "[S]earch [N]eovim files" }, opts)

    -- Grep
    set_keymap("n", "<leader>fg", fzf.live_grep, { desc = "[F]ind [G]rep" }, opts)
    set_keymap("n", "<leader>fw", fzf.grep_cword, { desc = "[F]ind current [W]ord" }, opts)
    set_keymap("n", "<leader>/", fzf.grep_curbuf, { desc = "Search [/] in current buffer" }, opts)

    -- Git
    set_keymap("n", "<leader>gB", fzf.git_branches, { desc = "Git [B]ranches" }, opts)
    set_keymap("n", "<leader>fgs", fzf.git_stash, { desc = "Git [S]tashes" }, opts)
    set_keymap("n", "<leader>fc", fzf.git_bcommits, { desc = "Git commits current buffer" }, opts)

    -- Misc
    set_keymap("n", "<leader>fs", fzf.builtin, { desc = "[F]ind [B]uiltin fzf commands" }, opts)
    set_keymap("n", "<leader>fk", fzf.keymaps, { desc = "[F]ind [K]eymaps" }, opts)
    set_keymap("n", "<leader>fh", fzf.helptags, { desc = "[F]ind [H]elp" }, opts)

    fzf.setup {
      keymap        = {
        -- Below are the default binds, setting any value in these tables will override
        -- the defaults, to inherit from the defaults change [1] from `false` to `true`
        builtin = {
          false,                -- do not inherit from defaults
          -- neovim `:tmap` mappings for the fzf win
          ["<M-Esc>"]    = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
          ["<F1>"]       = "toggle-help",
          ["<F2>"]       = "toggle-fullscreen",
          -- Only valid with the 'builtin' previewer
          ["<F3>"]       = "toggle-preview-wrap",
          ["<F4>"]       = "toggle-preview",
          -- Rotate preview clockwise/counter-clockwise
          ["<F5>"]       = "toggle-preview-ccw",
          ["<F6>"]       = "toggle-preview-cw",
          ["<S-down>"]   = "preview-page-down",
          ["<S-up>"]     = "preview-page-up",
          ["<M-S-down>"] = "preview-down",
          ["<M-S-up>"]   = "preview-up",
        },
        fzf = {
          false, -- do not inherit from defaults
          -- fzf '--bind=' options
          ["ctrl-z"]     = "abort",
          ["ctrl-u"]     = "unix-line-discard",
          ["ctrl-f"]     = "half-page-down",
          ["ctrl-b"]     = "half-page-up",
          ["ctrl-a"]     = "beginning-of-line",
          ["ctrl-e"]     = "end-of-line",
          ["alt-a"]      = "toggle-all",
          ["alt-g"]      = "last",
          ["alt-G"]      = "first",
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ["f3"]         = "toggle-preview-wrap",
          ["f4"]         = "toggle-preview",
          ["shift-down"] = "preview-page-down",
          ["shift-up"]   = "preview-page-up",
        },
      },
    }
  end
}
