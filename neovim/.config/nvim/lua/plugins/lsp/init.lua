-- ┏━━━━━┓
-- ┃ lsp ┃
-- ┗━━━━━┛

local M = {}

M[1] = require('plugins.lsp.config')
M[2] = require('plugins.lsp.mason')
M[3] = require('plugins.lsp.inc-rename')

return M
