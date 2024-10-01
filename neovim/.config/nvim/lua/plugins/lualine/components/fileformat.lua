-- ┏━━━━━━━━━━━━┓
-- ┃ fileformat ┃
-- ┗━━━━━━━━━━━━┛

local M = {}

M[1] = 'fileformat'

M.symbols = {
  unix = 'Unix',
  dos = 'DOS',
  mac = 'Mac',
}

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.FILE_CODE),
  color = {
    fg = require('nightfox.palette').load('carbonfox').yellow.base,
  },
}

M.color = {
  fg = require('nightfox.palette').load('carbonfox').fg1,
}

M.padding = {
  right = 1,
}

return M
