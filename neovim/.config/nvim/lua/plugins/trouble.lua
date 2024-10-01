-- ┏━━━━━━━━━┓
-- ┃ trouble ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'folke/trouble.nvim'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    { 'n', '<Leader>xx', function() require('trouble').toggle({ mode = 'diagnostics', filter = { buf = 0 } }) end },
    { 'n', '<Leader>xX', function() require('trouble').toggle({ mode = 'diagnostics' }) end },
    {
      'n',
      '[x',
      function()
        require('trouble').prev({ mode = 'diagnostics', skip_groups = true, jump = true, filter = { buf = 0 } })
      end,
    },
    {
      'n',
      ']x',
      function()
        require('trouble').next({ mode = 'diagnostics', skip_groups = true, jump = true, filter = { buf = 0 } })
      end,
    },
    { 'n', '[X', function() require('trouble').first({ mode = 'diagnostics', skip_groups = true, jump = true }) end },
    { 'n', ']X', function() require('trouble').last({ mode = 'diagnostics', skip_groups = true, jump = true }) end }
  )
end

M.opts = function() return {} end

return M
