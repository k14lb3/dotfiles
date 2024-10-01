-- ┏━━━━━━━━━┓
-- ┃ harpoon ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'harpoon2'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.ANCHOR),
  color = {
    fg = require('nightfox.palette').load('carbonfox').cyan.base,
  },
}

M.color = {
  fg = require('nightfox.palette').load('carbonfox').fg1,
  bg = 'NONE',
}

M.padding = {
  left = 1,
}

return M
