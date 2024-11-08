-- ┏━━━━━━━━━━┓
-- ┃ barbecue ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'utilyre/barbecue.nvim'

M.dependencies = {
  'SmiteshP/nvim-navic',
  'nvim-tree/nvim-web-devicons',
}

M.lazy = false

M.opts = function() return {} end

return M
