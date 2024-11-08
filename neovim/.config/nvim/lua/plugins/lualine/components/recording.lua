-- ┏━━━━━━━━━━━┓
-- ┃ recording ┃
-- ┗━━━━━━━━━━━┛

local M = {}

M[1] = require('noice').api.statusline.mode.get

M.cond = require('noice').api.statusline.mode.has

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.RECORD),
  color = {
    fg = require('lackluster.color').red,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
}

M.padding = {
  left = 1,
}

return M
