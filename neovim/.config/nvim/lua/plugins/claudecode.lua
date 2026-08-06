-- ┏━━━━━━━━━━━━┓
-- ┃ claudecode ┃
-- ┗━━━━━━━━━━━━┛

local M = {}

M[1] = 'coder/claudecode.nvim'

M.dependencies = {
  'folke/snacks.nvim',
}

M.cmd = {
  'ClaudeCode',
  'ClaudeCodeFocus',
  'ClaudeCodeSelectModel',
  'ClaudeCodeAdd',
  'ClaudeCodeSend',
  'ClaudeCodeTreeAdd',
  'ClaudeCodeStatus',
  'ClaudeCodeStart',
  'ClaudeCodeStop',
  'ClaudeCodeOpen',
  'ClaudeCodeClose',
  'ClaudeCodeDiffAccept',
  'ClaudeCodeDiffDeny',
  'ClaudeCodeCloseAllDiffs',
}

M.init = function()
  require('utils').set_keymaps(
    { 'n', '<Char-0x1e>', '<Cmd>ClaudeCode<CR>' },
    { 'n', '<leader>.f', '<Cmd>ClaudeCodeAdd %<CR>' },
    { 'v', '<leader>.t', '<Cmd>ClaudeCodeSend<CR>' },
    { 'n', '<leader>.t', '<cmd>.ClaudeCodeSend<cr>' },
    { 'n', '<leader>.a', '<cmd>ClaudeCodeDiffAccept<CR>' },
    { 'n', '<leader>.d', '<cmd>ClaudeCodeDiffDeny<CR>' }
  )

  require('utils').create_autocmd('FileType', {
    pattern = 'oil',
    callback = function(event)
      require('utils').set_buffer_keymaps(event.buf, {
        'n',
        '<leader>.f',
        '<cmd>ClaudeCodeTreeAdd<CR>',
      })
    end,
  })
end

M.opts = function()
  return {
    focus_after_send = true,
    terminal = {
      split_width_percentage = 0.4,
      snacks_win_opts = {
        keys = {
          toggle = {
            '<Char-0x1e>',
            function()
              vim.cmd('stopinsert')
              vim.cmd('ClaudeCode')
            end,
            mode = 't',
          },
          move_left = {
            '<C-h>',
            function()
              vim.cmd('stopinsert')
              require('tmux').move_left()
            end,
            mode = 't',
          },
          move_bottom = {
            '<C-j>',
            function()
              vim.cmd('stopinsert')
              require('tmux').move_bottom()
            end,
            mode = 't',
          },
          move_top = {
            '<C-k>',
            function()
              vim.cmd('stopinsert')
              require('tmux').move_top()
            end,
            mode = 't',
          },
          move_right = {
            '<C-l>',
            function()
              vim.cmd('stopinsert')
              require('tmux').move_right()
            end,
            mode = 't',
          },
        },
      },
    },
  }
end

return M
