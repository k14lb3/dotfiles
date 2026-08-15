-- ┏━━━━━━━━━┓
-- ┃ lazygit ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'kdheepak/lazygit.nvim'

M.dependencies = {
  'slugbyte/lackluster.nvim',
}

M.cmd = {
  'LazyGit',
  'LazyGitConfig',
  'LazyGitCurrentFile',
  'LazyGitFilter',
  'LazyGitFilterCurrentFile',
}

M.init = function()
  require('utils').set_keymap('n', '<Leader>lg', '<Cmd>LazyGit<CR>')

  require('utils').set_global('lazygit_floating_window_scaling_factor', 0.9)
  require('utils').set_global(
    'lazygit_floating_window_border_chars',
    { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
  )
  require('utils').set_highlight_group(0, 'LazyGitBorder', {
    fg = require('lackluster.color').gray4,
  })

  require('utils').create_autocmd('FileType', {
    pattern = 'lazygit',
    callback = function()
      local win = vim.api.nvim_get_current_win()
      local config = vim.api.nvim_win_get_config(win)
      config.row = config.row - 1
      vim.api.nvim_win_set_config(win, config)
    end,
  })
end

return M
