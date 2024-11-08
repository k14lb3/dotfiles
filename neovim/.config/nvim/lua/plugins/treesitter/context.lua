-- ┏━━━━━━━━━┓
-- ┃ context ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'nvim-treesitter/nvim-treesitter-context'

M.dependencies = {
  'nvim-treesitter/nvim-treesitter',
}

M.init = function() require('utils').set_keymap('n', '<Leader>tc', require('treesitter-context').toggle) end

M.event = 'VeryLazy'

M.opts = function()
  return {
    enable = false,
    separator = '─',
  }
end

return M
