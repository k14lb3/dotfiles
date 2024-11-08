-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'ThePrimeagen/harpoon'

M.branch = 'harpoon2'

M.commit = 'e76cb03' -- https://github.com/ThePrimeagen/harpoon/issues/577#issue-2246493795

M.dependencies = {
  'nvim-lua/plenary.nvim',
}

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    { 'n', '<Leader><Leader>', function() require('harpoon'):list():add() end },
    { 'n', '<Leader> ', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end },
    { 'n', '<Leader><S-Tab>', function() require('harpoon'):list():prev({ ui_nav_wrap = true }) end },
    { 'n', '<Leader><Tab>', function() require('harpoon'):list():next({ ui_nav_wrap = true }) end },
    { 'n', '<Leader>1', function() require('harpoon'):list():select(1) end },
    { 'n', '<Leader>2', function() require('harpoon'):list():select(2) end },
    { 'n', '<Leader>3', function() require('harpoon'):list():select(3) end },
    { 'n', '<Leader>4', function() require('harpoon'):list():select(4) end }
  )
end

M.opts = function()
  return {
    settings = {
      save_on_toggle = true,
    },
  }
end

return M
