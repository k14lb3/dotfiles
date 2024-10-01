-- ┏━━━━━┓
-- ┃ eol ┃
-- ┗━━━━━┛

local M = {}

M[1] = 'fileformat'

M.symbols = {
  unix = 'LF',
  dos = 'CRLF',
  mac = 'CR',
}

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.NEWLINE),
  color = {
    fg = require('nightfox.palette').load('carbonfox').green.base,
  },
}

M.color = {
  fg = require('nightfox.palette').load('carbonfox').fg1,
}

M.padding = {
  right = 1,
}

return M
