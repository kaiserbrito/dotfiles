local status, npairs = pcall(require, "nvim-autopairs")
if (not status) then return end

npairs.setup({
  enable_check_bracket_line = false,
  ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})

npairs.add_rules(require('nvim-autopairs.rules.endwise-elixir'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
