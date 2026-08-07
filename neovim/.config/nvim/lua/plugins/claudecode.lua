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

  local function is_claudecode_terminal_open()
    local bufnr = require('claudecode.terminal').get_active_terminal_bufnr()
    return bufnr and vim.fn.bufwinid(bufnr) ~= -1
  end

  require('utils').create_autocmds(
    {
      'FileType',
      {
        pattern = 'oil',
        callback = function(event)
          require('utils').set_buffer_keymaps(event.buf, {
            'n',
            '<leader>.f',
            '<cmd>ClaudeCodeTreeAdd<CR>',
          })
        end,
      },
    },
    {
      'User',
      {
        pattern = 'ClaudeCodeDiffOpened',
        callback = function()
          if is_claudecode_terminal_open() then vim.cmd('ClaudeCode') end
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'oil' then
              vim.api.nvim_win_close(win, false)
            end
          end
        end,
      },
    },
    {
      'User',
      {
        pattern = 'ClaudeCodeDiffClosed',
        callback = function()
          if not is_claudecode_terminal_open() then vim.cmd('ClaudeCode') end
        end,
      },
    }
  )
end

M.opts = function()
  return {
    focus_after_send = true,
    terminal_cmd = vim.fn.executable('headroom') == 1 and 'headroom wrap claude' or nil,
    terminal = {
      split_width_percentage = 0.4,
      snacks_win_opts = {
        keys = {
          open_terminal = {
            '<C-\\>',
            function() require('toggleterm').toggle_command() end,
            mode = 't',
          },
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
    diff_opts = {
      auto_resize_terminal = false,
    },
  }
end

return M
