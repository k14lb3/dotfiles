-- ┏━━━━━━━━━━━━┓
-- ┃ treesitter ┃
-- ┗━━━━━━━━━━━━┛

local M = {}

M[1] = require('plugins.treesitter.config')
M[2] = require('plugins.treesitter.context')
M[3] = require('plugins.treesitter.textobjects')
M[4] = require('plugins.treesitter.commentstring')

return M
