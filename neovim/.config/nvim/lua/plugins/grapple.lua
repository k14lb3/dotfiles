-- ┏━━━━━━━━━┓
-- ┃ grapple ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'cbochs/grapple.nvim'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    { 'n', '<Leader><Leader>', require('grapple').toggle },
    { 'n', '<Leader> ', require('grapple').toggle_tags },
    { 'n', '<Leader><S-Tab>', function() require('grapple').cycle_tags('prev') end },
    { 'n', '<Leader><Tab>', function() require('grapple').cycle_tags('next') end },
    { 'n', '<Leader>1', function() require('grapple').select({ index = 1 }) end },
    { 'n', '<Leader>2', function() require('grapple').select({ index = 2 }) end },
    { 'n', '<Leader>3', function() require('grapple').select({ index = 3 }) end },
    { 'n', '<Leader>4', function() require('grapple').select({ index = 4 }) end }
  )
end

M.opts = function()
  return {
    win_opts = {
      title_pos = 'left',
      footer = '',
    },
  }
end

return M
