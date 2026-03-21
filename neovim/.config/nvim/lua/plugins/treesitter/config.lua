-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'nvim-treesitter/nvim-treesitter'

M.branch = 'main'

M.build = ':TSUpdate'

M.lazy = false

M.config = function() require('nvim-treesitter').install(require('constants').TREESITTER_PARSERS) end

return M
