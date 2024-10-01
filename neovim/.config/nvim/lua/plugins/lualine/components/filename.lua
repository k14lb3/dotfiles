-- ┏━━━━━━━━━━┓
-- ┃ filename ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'filename'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.FILE),
  color = {
    fg = require('nightfox.palette').load('carbonfox').magenta.base,
  },
}

M.color = {
  fg = require('nightfox.palette').load('carbonfox').fg1,
  bg = 'NONE',
}

M.padding = {
  left = 0,
}

return M
