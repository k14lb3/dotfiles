-- ┏━━━━━━━━━━━━━┓
-- ┃ textobjects ┃
-- ┗━━━━━━━━━━━━━┛

local M = {}

M[1] = 'nvim-treesitter/nvim-treesitter-textobjects'

M.branch = 'main'

M.dependencies = {
  'nvim-treesitter/nvim-treesitter',
}

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_global('no_plugin_maps', true)
end

M.opts = function()
  return {

    select = {
      lookahead = true,
    },
    move = {
      set_jumps = true,
    },
  }
end

M.config = function(_, opts)
  require('nvim-treesitter-textobjects').setup(opts)

  require('utils').set_keymaps(
    {
      { 'x', 'o' },
      'af',
      function() require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects') end,
    },
    {
      { 'x', 'o' },
      'if',
      function() require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects') end,
    },
    {
      { 'x', 'o' },
      'ac',
      function() require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects') end,
    },
    {
      { 'x', 'o' },
      'ic',
      function() require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects') end,
    },
    {
      { 'x', 'o' },
      'aB',
      function() require('nvim-treesitter-textobjects.select').select_textobject('@block.outer', 'textobjects') end,
    },
    {
      { 'x', 'o' },
      'iB',
      function() require('nvim-treesitter-textobjects.select').select_textobject('@block.inner', 'textobjects') end,
    },
    {
      { 'n', 'x', 'o' },
      ']f',
      function() require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects') end,
    },
    {
      { 'n', 'x', 'o' },
      ']c',
      function() require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects') end,
    },
    {
      { 'n', 'x', 'o' },
      ']F',
      function() require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects') end,
    },
    {
      { 'n', 'x', 'o' },
      ']C',
      function() require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects') end,
    },
    {
      { 'n', 'x', 'o' },
      '[f',
      function() require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects') end,
    },
    {
      { 'n', 'x', 'o' },
      '[c',
      function() require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects') end,
    },
    {
      { 'n', 'x', 'o' },
      '[F',
      function() require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects') end,
    },
    {
      { 'n', 'x', 'o' },
      '[C',
      function() require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects') end,
    },
    { 'n', '<Leader>a', function() require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner') end },
    { 'n', '<Leader>A', function() require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner') end }
  )
end

return M
