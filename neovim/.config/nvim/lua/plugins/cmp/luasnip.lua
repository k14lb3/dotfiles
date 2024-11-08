-- ┏━━━━━━━━━┓
-- ┃ luasnip ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'L3MON4D3/LuaSnip'

M.dependencies = {
  'rafamadriz/friendly-snippets',
}

M.event = 'VeryLazy'

M.build = 'make install_jsregexp'

M.config = function() require('luasnip.loaders.from_vscode').lazy_load() end

return M
