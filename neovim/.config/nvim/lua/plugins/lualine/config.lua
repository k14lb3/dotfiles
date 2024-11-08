-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'nvim-lualine/lualine.nvim'

M.dependencies = {
  'slugbyte/lackluster.nvim',
  'nvim-tree/nvim-web-devicons',
}

M.lazy = false

M.opts = function()
  return {
    options = {
      theme = {
        normal = {
          a = {
            fg = require('lackluster.color').luster,
            bg = require('lackluster.color').gray2,
          },
          b = {},
          c = {},
        },
        insert = {
          a = {
            fg = require('lackluster.color').luster,
            bg = require('lackluster.color').gray2,
          },
        },
        command = {
          a = {
            fg = require('lackluster.color').luster,
            bg = require('lackluster.color').gray2,
          },
        },
        visual = {
          a = {
            fg = require('lackluster.color').luster,
            bg = require('lackluster.color').gray2,
          },
        },
        replace = {
          a = {
            fg = require('lackluster.color').luster,
            bg = require('lackluster.color').gray2,
          },
        },
        inactive = {
          a = {
            fg = require('lackluster.color').luster,
            bg = require('lackluster.color').gray2,
          },
          b = {},
          c = {},
        },
      },
      component_separators = '',
      section_separators = '',
      globalstatus = true,
    },
    sections = {
      lualine_b = {
        require('plugins.lualine.components.filename'),
        require('plugins.lualine.components.harpoon'),
      },
      lualine_c = {
        require('plugins.lualine.components.recording'),
        require('plugins.lualine.components.diagnostics'),
      },
      lualine_x = {
        require('plugins.lualine.components.diff'),
        require('plugins.lualine.components.encoding'),
        require('plugins.lualine.components.fileformat'),
        require('plugins.lualine.components.eol'),
        require('plugins.lualine.components.filetype'),
      },
      lualine_y = {
        require('plugins.lualine.components.progress'),
        require('plugins.lualine.components.location'),
      },
      lualine_z = {},
    },
  }
end

return M
