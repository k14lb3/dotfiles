-- ┏━━━━━━━━━━┓
-- ┃ progress ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'progress'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.ARROW_UP_DOWN),
  color = {
    fg = require('lackluster.color').magenta,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
}

M.padding = {
  left = 0,
  right = 1,
}

return M
