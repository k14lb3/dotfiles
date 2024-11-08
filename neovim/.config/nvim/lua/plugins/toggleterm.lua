-- ┏━━━━━━━━━━━━┓
-- ┃ toggleterm ┃
-- ┗━━━━━━━━━━━━┛

local M = {}

M[1] = 'akinsho/toggleterm.nvim'

M.version = '*'

M.dependencies = {
  'slugbyte/lackluster.nvim',
}

M.event = 'VeryLazy'

M.init = function()
  require('utils').create_autocmd({ 'TermOpen' }, {
    pattern = { 'term://*' },
    callback = function(event) require('utils').set_keymap('t', '<C-]>', '<C-\\><C-n>', { buffer = event.buf }) end,
  })
end

M.opts = function()
  return {
    open_mapping = '<C-\\>',
    shade_terminals = false,
    direction = 'float',
    float_opts = {
      winblend = 0,
    },
    highlights = {
      FloatBorder = {
        guifg = require('lackluster.color').gray4,
      },
    },
  }
end

return M
