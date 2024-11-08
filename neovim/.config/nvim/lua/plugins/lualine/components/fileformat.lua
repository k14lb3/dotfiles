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
    fg = require('lackluster.color').yellow,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
}

M.padding = {
  right = 1,
}

return M
