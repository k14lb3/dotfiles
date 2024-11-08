-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'nvim-treesitter/nvim-treesitter'

M.build = ':TSUpdate'

M.lazy = false

M.main = 'nvim-treesitter.configs'

M.opts = function()
  return {
    ensure_installed = require('constants').TREESITTER_PARSERS,
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-Space>',
        node_incremental = '<C-Space>',
        scope_incremental = false,
        node_decremental = '<BS>',
      },
    },
  }
end

return M
