-- ┏━━━━━━━━━━┓
-- ┃ nightfox ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'EdenEast/nightfox.nvim'

M.lazy = false

M.priority = 9000

M.opts = function()
  return {
    options = {
      transparent = true,
    },
    groups = {
      all = {
        NormalFloat = {
          bg = 'NONE',
        },
        LspInfoBorder = {
          fg = 'fg3',
        },
      },
    },
  }
end

M.config = function(_, opts)
  require('nightfox').setup(opts)

  vim.cmd('colorscheme carbonfox')
end

return M
