-- ┏━━━━━━┓
-- ┃ diff ┃
-- ┗━━━━━━┛

local M = {}

M[1] = 'diff'

M.icon = {
  require('constants').ICONS.SHADE,
  color = {
    fg = require('lackluster.color').purple,
  },
}

M.diff_color = {
  added = {
    fg = require('lackluster.color').green,
  },
  modified = {
    fg = require('lackluster.color').yellow,
  },
  removed = {
    fg = require('lackluster.color').red,
  },
}

M.symbols = {
  added = string.format('%s ', require('constants').ICONS.PLUS),
  modified = string.format('%s ', require('constants').ICONS.ASTERISK),
  removed = string.format('%s ', require('constants').ICONS.MINUS),
}

return M
