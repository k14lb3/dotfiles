-- ┏━━━━━━━━━━━━━┓
-- ┃ diagnostics ┃
-- ┗━━━━━━━━━━━━━┛

local M = {}

M[1] = 'diagnostics'

M.icon = {
  require('constants').ICONS.SHADE,
  color = {
    fg = require('lackluster.color').magenta,
  },
}

M.symbols = {
  error = string.format('%s ', require('constants').ICONS.ERROR),
  warn = string.format('%s ', require('constants').ICONS.WARN),
  info = string.format('%s ', require('constants').ICONS.INFO),
  hint = string.format('%s ', require('constants').ICONS.HINT),
}

M.padding = {
  left = 1,
}

return M
