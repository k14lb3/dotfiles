-- ┏━━━━━━━━━┓
-- ┃ grapple ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'grapple'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.HOOK),
  color = {
    fg = require('lackluster.color').blue,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
  bg = 'NONE',
}

M.padding = {
  left = 1,
}

return M
