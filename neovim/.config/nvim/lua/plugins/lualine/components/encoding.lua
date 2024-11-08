-- ┏━━━━━━━━━━┓
-- ┃ encoding ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'encoding'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.FONT),
  color = {
    fg = require('lackluster.color').lack,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
}

M.padding = {
  right = 1,
}

return M
