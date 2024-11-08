-- ┏━━━━━━━━━┓
-- ┃ harpoon ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'harpoon2'

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.ANCHOR),
  color = {
    fg = require('lackluster.color').blue,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
  bg = 'NONE',
}

M.padding = {
  left = 1,
}

return M
