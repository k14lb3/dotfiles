-- ┏━━━━━━━━━━━━━━━┓
-- ┃ todo-comments ┃
-- ┗━━━━━━━━━━━━━━━┛

local M = {}

M[1] = 'folke/todo-comments.nvim'

M.dependencies = {
  'nvim-lua/plenary.nvim',
  'folke/trouble.nvim',
}

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    { 'n', '[t', function() require('todo-comments').jump_prev() end },
    { 'n', ']t', function() require('todo-comments').jump_next() end },
    {
      'n',
      '<Leader>tt',
      function()
        require('trouble').toggle({
          mode = 'todo',
          filter = {
            buf = 0,
            tag = { 'TODO', 'FIX', 'FIXME' },
          },
        })
      end,
    },
    {
      'n',
      '<Leader>tT',
      function()
        require('trouble').toggle({
          mode = 'todo',
          filter = {
            tag = { 'TODO', 'FIX', 'FIXME' },
          },
        })
      end,
    }
  )
end

M.opts = function()
  return {
    search = {
      args = {
        '--hidden',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--glob=!.git/*',
      },
    },
  }
end

return M
