-- ┏━━━━━━━━━━┓
-- ┃ progress ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'progress'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.ARROW_UP_DOWN),
  color = {
    fg = require('nightfox.palette').load('carbonfox').red.base,
  },
}

M.color = {
  fg = require('nightfox.palette').load('carbonfox').fg1,
  bg = 'NONE',
}

M.padding = {
  left = 0,
  right = 1,
}

return M
