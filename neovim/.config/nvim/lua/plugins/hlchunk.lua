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
          fg = require('lackluster.color').lack,
        },
        {
          fg = require('lackluster.color').red,
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
      style = require('lackluster.color').lack,
    },
  }
end

return M
