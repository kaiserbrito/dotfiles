local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require "cmp"
local luasnip = require "luasnip"
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = { completeopt = "menu,menuone,noinsert" },

  -- For an understanding of why these mappings were
  -- chosen, you will need to read `:help ins-completion`
  --
  -- No, but seriously. Please read `:help ins-completion`, it is really good!
  mapping = cmp.mapping.preset.insert {
    -- Select the [n]ext item
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Select the [p]revious item
    ["<C-p>"] = cmp.mapping.select_prev_item(),

    -- Scroll the documentation window [b]ack / [f]orward
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    -- Manually trigger a completion from nvim-cmp.
    --  Generally you don't need this, because nvim-cmp will display
    --  completions whenever it has completion options available.
    ["<C-Space>"] = cmp.mapping.complete {},

    -- Accept ([y]es) the completion.
    --  This will auto-import if your LSP supports it.
    --  This will expand snippets if the LSP sent a snippet.
    ["<CR>"] = cmp.mapping.confirm { select = true },

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- that way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    --
    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "copilot" },
  },
}

