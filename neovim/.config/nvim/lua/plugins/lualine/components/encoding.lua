-- ┏━━━━━━━━━━┓
-- ┃ encoding ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'encoding'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.FONT),
  color = {
    fg = require('nightfox.palette').load('carbonfox').cyan.base,
  },
}

M.color = {
  fg = require('nightfox.palette').load('carbonfox').fg1,
}

M.padding = {
  right = 1,
}

return M
