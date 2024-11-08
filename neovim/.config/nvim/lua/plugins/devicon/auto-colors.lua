-- ┏━━━━━━━━━━━━━┓
-- ┃ auto-colors ┃
-- ┗━━━━━━━━━━━━━┛

local M = {}

M[1] = 'rachartier/tiny-devicons-auto-colors.nvim'

M.dependencies = {
  'slugbyte/lackluster.nvim',
  'nvim-tree/nvim-web-devicons',
}

M.event = 'VeryLazy'

M.opts = function()
  return {
    cache = {
      enabled = true,
      path = string.format('%s/tiny-devicons-auto-colors.json', vim.fn.stdpath('cache')),
    },
    colors = {
      require('lackluster.color').lack,
      require('lackluster.color').luster,
      require('lackluster.color').red,
      require('lackluster.color').magenta,
      require('lackluster.color').green,
      require('lackluster.color').blue,
      require('lackluster.color').orange,
      require('lackluster.color').yellow,
      require('lackluster.color').purple,
      require('lackluster.color').black,
      require('lackluster.color').gray1,
      require('lackluster.color').gray2,
      require('lackluster.color').gray3,
      require('lackluster.color').gray4,
      require('lackluster.color').gray5,
      require('lackluster.color').gray6,
      require('lackluster.color').gray7,
      require('lackluster.color').gray8,
      require('lackluster.color').gray9,
    },
  }
end

return M
