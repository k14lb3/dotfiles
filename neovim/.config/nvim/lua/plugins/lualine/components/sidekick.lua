-- ┏━━━━━━━━━━┓
-- ┃ sidekick ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = function()
  local tool = require('sidekick.status').cli()[1].tool
  return string.format('%s ', tool:sub(1, 1):upper() .. tool:sub(2))
end

M.cond = function() return #require('sidekick.status').cli() > 0 end

M.icon = {
  string.format('%s %s', require('constants').ICONS.SHADE, require('constants').ICONS.ROBOT),
  color = {
    fg = require('lackluster.color').blue,
  },
}

M.color = {
  fg = require('lackluster.color').blue,
  bg = 'NONE',
}

M.padding = {
  left = 1,
}

return M
