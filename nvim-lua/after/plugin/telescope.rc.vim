if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> <C-p> :lua require('telescope.builtin').find_files()<cr>
nnoremap <silent> ;g :lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> \\ :lua require('telescope.builtin').buffers()<cr>
nnoremap <silent> ;; :lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF
