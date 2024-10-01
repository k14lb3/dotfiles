-- ┏━━━━━━━━━━━┓
-- ┃ recording ┃
-- ┗━━━━━━━━━━━┛

local M = {}

M[1] = require('noice').api.statusline.mode.get

M.cond = require('noice').api.statusline.mode.has

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.RECORD),
  color = {
    fg = require('nightfox.palette').load('carbonfox').red.base,
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
