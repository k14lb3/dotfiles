-- ┏━━━━━━━━━━┓
-- ┃ filename ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'filename'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.FILE),
  color = {
    fg = require('lackluster.color').yellow,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
}

M.padding = {
  left = 0,
}

return M
