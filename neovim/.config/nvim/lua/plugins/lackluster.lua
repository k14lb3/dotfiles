-- ┏━━━━━━━━━━━━┓
-- ┃ lackluster ┃
-- ┗━━━━━━━━━━━━┛

local M = {}

M[1] = 'slugbyte/lackluster.nvim'

M.lazy = false

M.priority = 9000

M.init = function() vim.cmd('colorscheme lackluster') end

M.opts = function()
  return {
    tweak_color = {
      purple = '#875FA6',
      magenta = '#D7007D',
    },
    tweak_background = {
      normal = 'none',
      telescope = 'none',
      menu = 'none',
      popup = 'none',
    },
    tweak_highlight = {
      StatusLine = {
        fg = require('lackluster.color').luster,
        bg = 'NONE',
      },
      TelescopeBorder = {
        fg = require('lackluster.color').gray4,
      },
      NoiceCmdlinePopupBorder = {
        fg = require('lackluster.color').gray4,
      },
    },
  }
end

return M
