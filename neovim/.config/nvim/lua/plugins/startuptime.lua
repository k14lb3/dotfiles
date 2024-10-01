-- ┏━━━━━━━━━━━━━┓
-- ┃ startuptime ┃
-- ┗━━━━━━━━━━━━━┛

local M = {}

M[1] = 'dstein64/vim-startuptime'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_global('startuptime_tries', 10)
  require('utils').set_keymap('n', '<Leader>st', '<Cmd>StartupTime<CR>')
end

return M
