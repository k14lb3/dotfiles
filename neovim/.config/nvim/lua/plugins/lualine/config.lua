-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'nvim-lualine/lualine.nvim'

M.dependencies = {
  'nvim-tree/nvim-web-devicons',
}

M.lazy = false

M.opts = function()
  return {
    options = {
      theme = 'carbonfox',
      component_separators = '',
      section_separators = '',
      globalstatus = true,
      disabled_filetypes = {
        statusline = {
          'oil',
        },
      },
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
      },
    },
  }
end

return M
