-- ┏━━━━━━┓
-- ┃ diff ┃
-- ┗━━━━━━┛

local M = {}

M[1] = 'diff'

M.icon = {
  require('constants').ICONS.SHADE,
  color = {
    fg = require('nightfox.palette').load('carbonfox').magenta.base,
  },
}

M.diff_color = {
  added = 'GitSignsAdd',
  modified = 'GitSignsChange',
  removed = 'GitSignsDelete',
}

M.symbols = {
  added = string.format('%s ', require('constants').ICONS.PLUS),
  modified = string.format('%s ', require('constants').ICONS.ASTERISK),
  removed = string.format('%s ', require('constants').ICONS.MINUS),
}

return M
