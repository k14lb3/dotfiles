-- ┏━━━━━━━━━━┓
-- ┃ filetype ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = function() return vim.bo.filetype end

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.FILE_DOCUMENT),
  color = {
    fg = require('lackluster.color').orange,
  },
}

M.color = {
  fg = require('lackluster.color').luster,
}

M.padding = {
  right = 1,
}

return M
