-- ┏━━━━━━━━━┓
-- ┃ trouble ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'folke/trouble.nvim'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    { 'n', '<Leader>xx', function() require('trouble').toggle({ mode = 'diagnostics', filter = { buf = 0 } }) end },
    { 'n', '<Leader>xX', function() require('trouble').toggle({ mode = 'diagnostics' }) end }
  )
end

M.opts = function()
  return {
    auto_close = true,
    warn_no_results = false,
  }
end

return M
