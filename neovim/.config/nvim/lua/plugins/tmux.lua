-- ┏━━━━━━┓
-- ┃ tmux ┃
-- ┗━━━━━━┛

local M = {}

M[1] = 'aserowy/tmux.nvim'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    { { 'n', 'x', 'o' }, '<C-S-Left>', require('tmux').resize_left },
    { { 'n', 'x', 'o' }, '<C-S-Down>', function() require('tmux').resize_bottom() end },
    { { 'n', 'x', 'o' }, '<C-S-Up>', function() require('tmux').resize_top() end },
    { { 'n', 'x', 'o' }, '<C-S-Right>', function() require('tmux').resize_right() end }
  )
end

M.opts = function()
  return {
    resize = {
      enable_default_keybindings = false,
    },
    copy_sync = {
      redirect_to_clipboard = true,
    },
  }
end

return M
