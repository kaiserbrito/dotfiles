vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.surround", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.pairs", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.hipatterns", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.ai", version = "stable" },
  { src = "https://github.com/nvim-mini/mini.snippets", version = "stable" },
})

-- mini.icons setup with web-devicons mocking
require("mini.icons").setup()
package.preload["nvim-web-devicons"] = function()
  require("mini.icons").mock_nvim_web_devicons()
  return package.loaded["nvim-web-devicons"]
end

-- mini.surround setup
require("mini.surround").setup()

-- mini.pairs setup
require("mini.pairs").setup()

-- mini.hipatterns setup
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

-- mini.ai setup
require("mini.ai").setup()

--- mini snippets ---
local mini_snippets = require("mini.snippets")
mini_snippets.setup({
  snippets = {
    mini_snippets.gen_loader.from_lang(),
  },
})
mini_snippets.start_lsp_server({ match = false })
