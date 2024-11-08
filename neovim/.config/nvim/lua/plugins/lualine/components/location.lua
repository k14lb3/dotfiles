-- ┏━━━━━━━━━━┓
-- ┃ location ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = function() return string.format('%d:%d', vim.fn.line('.'), vim.fn.charcol('.')) end

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.PIN),
  color = {
    fg = require('lackluster.color').purple,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
}

M.padding = {
  left = 0,
  right = 1,
}

return M
