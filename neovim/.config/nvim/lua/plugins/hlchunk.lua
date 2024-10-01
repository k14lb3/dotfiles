-- ┏━━━━━━━━━┓
-- ┃ hlchunk ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'shellRaining/hlchunk.nvim'

M.dependencies = {
  'EdenEast/nightfox.nvim',
}

M.lazy = false

M.opts = function()
  return {
    indent = {
      enable = true,
    },
    chunk = {
      enable = true,
      style = {
        {
          fg = require('nightfox.palette').load('carbonfox').magenta.base,
        },
        {
          fg = require('nightfox.palette').load('carbonfox').red.base,
        },
      },
      chars = {
        left_top = '┌',
        left_bottom = '└',
        right_arrow = '─',
      },
      delay = 0,
    },
    line_num = {
      enable = true,
      style = require('nightfox.palette').load('carbonfox').magenta.base,
    },
  }
end

return M
