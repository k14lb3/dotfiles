-- ┏━━━━━━━━━┓
-- ┃ context ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'nvim-treesitter/nvim-treesitter-context'

M.dependencies = {
  'nvim-treesitter/nvim-treesitter',
}

M.event = 'VeryLazy'

M.opts = function()
  return {
    separator = '─',
  }
end

return M
