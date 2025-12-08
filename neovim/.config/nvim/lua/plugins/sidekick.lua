-- ┏━━━━━━━━━━┓
-- ┃ sidekick ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'folke/sidekick.nvim'

M.event = 'VeryLazy'

M.init = function()
  local cli_tool = 'cursor'

  require('utils').set_keymaps({
    { 'n', 't', 'i', 'x' },
    '<Char-0x1e>',
    function() require('sidekick.cli').toggle({ name = cli_tool, focus = true }) end,
  }, {
    { 'n', 'x' },
    '<leader>.t',
    function() require('sidekick.cli').send({ name = cli_tool, msg = '{this}' }) end,
  }, {
    { 'n' },
    '<leader>.f',
    function() require('sidekick.cli').send({ name = cli_tool, msg = '{file}' }) end,
  }, {
    { 'x' },
    '<leader>.v',
    function() require('sidekick.cli').send({ name = cli_tool, msg = '{selection}' }) end,
  }, {
    { 'n' },
    '<leader>.x',
    function() require('sidekick.cli').close() end,
  })
end

M.opts = {
  cli = {
    win = {
      keys = {
        open_terminal = {
          '<C-\\>',
          function() require('toggleterm').toggle_command() end,
          mode = 'nt',
        },
        files = { '<leader>ff', 'files', mode = 'nt' },
        hide_ctrl_q = { '<C-q>', 'hide', mode = 'n' },
        hide_ctrl_dot = { '<Char-0x1e>', 'hide', mode = 'nt' },
        hide_n = { 'q', 'hide', mode = 'n' },
        buffers = false,
        hide_ctrl_z = false,
        prompt = false,
        stopinsert = false,
      },
    },
  },
}

return M
