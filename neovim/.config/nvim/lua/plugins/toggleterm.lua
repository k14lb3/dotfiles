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
  local lazygit = require('toggleterm.terminal').Terminal:new({
    cmd = 'lazygit',
    hidden = true,
    direction = 'float',
    on_open = function(term)
      vim.api.nvim_win_call(term.window, function() vim.fn.winrestview({ topline = 1, leftcol = 0 }) end)
      require('utils').set_keymap('t', '<C-0>', function() term:toggle() end, { buffer = term.bufnr })
    end,
  })

  require('utils').set_keymap('n', '<C-0>', function() lazygit:toggle() end)

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
