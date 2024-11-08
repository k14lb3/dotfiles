-- ┏━━━━━━━━━━━━━━━┓
-- ┃ commentstring ┃
-- ┗━━━━━━━━━━━━━━━┛

local M = {}

M[1] = 'JoosepAlviste/nvim-ts-context-commentstring'

M.dependencies = {
  'nvim-treesitter/nvim-treesitter',
}

M.event = 'VeryLazy'

return M
