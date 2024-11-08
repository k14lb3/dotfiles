-- ┏━━━━━━━━━━━━┓
-- ┃ inc-rename ┃
-- ┗━━━━━━━━━━━━┛

local M = {}

M[1] = 'smjonas/inc-rename.nvim'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymap(
    'n',
    '<Leader>rn',
    function() return string.format(':%s %s', require('inc_rename').config.cmd_name, vim.fn.expand('<cword>')) end,
    { expr = true }
  )
end

M.opts = function() return {} end

return M
