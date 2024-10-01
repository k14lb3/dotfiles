-- ┏━━━━━━━━━┓
-- ┃ matchup ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'andymass/vim-matchup'

M.dependencies = {
  'nvim-treesitter/nvim-treesitter',
}
M.event = 'VeryLazy'

M.init = function()
  require('utils').set_global('matchup_matchparen_deferred', 1)
  require('utils').set_global('matchup_matchparen_status_offscreen', 0)
end

M.opts = function()
  return {
    matchup = {
      enable = true,
    },
  }
end

return M
