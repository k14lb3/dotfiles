-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'nvim-tree/nvim-web-devicons'

M.dependencies = {
  'slugbyte/lackluster.nvim',
}

M.event = 'VeryLazy'

M.opts = function() return {} end

return M
