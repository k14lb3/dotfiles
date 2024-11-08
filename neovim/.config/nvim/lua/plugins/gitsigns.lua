-- ┏━━━━━━━━━━┓
-- ┃ gitsigns ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'lewis6991/gitsigns.nvim'

M.lazy = false

M.opts = function()
  return {
    signs = {
      add = {
        text = '┃',
      },
      change = {
        text = '┃',
      },
      delete = {
        text = '',
      },
      topdelete = {
        text = '',
      },
      changedelete = {
        text = '┃',
      },
      untracked = {
        text = '┇',
      },
    },
    signs_staged_enable = false,
    on_attach = function(buffer)
      require('utils').set_buffer_keymaps(
        buffer,
        { 'n', ']h', function() require('gitsigns').nav_hunk('next') end },
        { 'n', '[h', function() require('gitsigns').nav_hunk('prev') end },
        { 'n', ']H', function() require('gitsigns').nav_hunk('last') end },
        { 'n', '[H', function() require('gitsigns').nav_hunk('first') end },
        { 'n', '<Leader>hs', require('gitsigns').stage_hunk },
        { 'v', '<Leader>hs', function() require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end },
        { 'n', '<Leader>hr', require('gitsigns').reset_hunk },
        { 'v', '<Leader>hr', function() require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end },
        { 'n', '<Leader>hS', require('gitsigns').stage_buffer },
        { 'n', '<Leader>hu', require('gitsigns').undo_stage_hunk },
        { 'n', '<Leader>hR', require('gitsigns').reset_buffer },
        { 'n', '<Leader>hp', require('gitsigns').preview_hunk_inline },
        { 'n', '<Leader>hb', require('gitsigns').blame_line },
        { 'n', '<Leader>hB', require('gitsigns').blame },
        { 'n', '<Leader>hd', require('gitsigns').diffthis },
        { 'n', '<Leader>hD', function() require('gitsigns').diffthis('~') end },
        {
          { 'o', 'x' },
          'ih',
          function()
            vim.cmd('normal! \27')
            require('gitsigns').select_hunk()
          end,
        }
      )
    end,
  }
end

return M
