-- ┏━━━━━━━━━┓
-- ┃ autotag ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'windwp/nvim-ts-autotag'

M.dependencies = {
  'nvim-treesitter/nvim-treesitter',
}

M.event = 'VeryLazy'

M.opts = function() return {} end

return M
