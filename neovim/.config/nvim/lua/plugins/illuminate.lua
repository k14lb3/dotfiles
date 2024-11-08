-- ┏━━━━━━━━━━━━┓
-- ┃ illuminate ┃
-- ┗━━━━━━━━━━━━┛

local M = {}

M[1] = 'RRethy/vim-illuminate'

M.event = 'VeryLazy'

M.init = function()
  require('utils').create_autocmd({ 'FileType' }, {
    group = require('utils').create_augroup('illuminate'),
    callback = function(event)
      require('utils').set_buffer_keymaps(
        event.buf,
        { 'n', '[[', require('illuminate').goto_prev_reference },
        { 'n', ']]', require('illuminate').goto_next_reference }
      )
    end,
  })
end

M.opts = function()
  return {
    delay = 200,
    filetypes_denylist = {
      'oil',
    },
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = {
        'lsp',
      },
    },
  }
end

M.config = function(_, opts) require('illuminate').configure(opts) end

return M
