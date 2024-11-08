-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ markdown-preview ┃
-- ┗━━━━━━━━━━━━━━━━━━┛

local M = {}

M[1] = 'iamcco/markdown-preview.nvim'

M.event = 'VeryLazy'

M.init = function()
  require('utils').create_autocmd({ 'FileType' }, {
    pattern = { 'markdown' },
    callback = function(event)
      require('utils').set_keymap(
        'n',
        '<Leader>tmp',
        function() vim.fn['mkdp#util#toggle_preview']() end,
        { buffer = event.buf }
      )
    end,
  })
end

M.build = function() vim.fn['mkdp#util#install']() end

return M
