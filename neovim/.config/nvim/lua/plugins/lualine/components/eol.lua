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
    fg = require('lackluster.color').green,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
}

M.padding = {
  right = 1,
}

return M
