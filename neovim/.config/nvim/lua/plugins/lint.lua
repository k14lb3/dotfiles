-- ┏━━━━━━┓
-- ┃ lint ┃
-- ┗━━━━━━┛

local M = {}

M[1] = 'mfussenegger/nvim-lint'

M.event = 'VeryLazy'

M.init = function()
  local lint = function()
    if not require('utils').get_global(require('constants').GLOBALS.IS_LINTING) then return end

    local current_buffer_lsp_clients = require('utils').get_current_buffer_lsp_clients()

    if require('utils').is_string_in_array(current_buffer_lsp_clients, 'ts_ls') then
      require('lint').try_lint('eslint_d')
      return
    end

    if require('utils').is_string_in_array(current_buffer_lsp_clients, 'denols') then
      require('lint').try_lint('deno')
      return
    end

    if require('utils').is_string_in_array(current_buffer_lsp_clients, 'pyright') then
      require('lint').try_lint('ruff')
      return
    end

    require('lint').try_lint()
  end

  require('utils').set_keymap('n', '<Leader>tl', function()
    if not require('utils').get_global(require('constants').GLOBALS.IS_LINTING) then
      require('utils').set_global(require('constants').GLOBALS.IS_LINTING, true)
      lint()
      return
    end

    require('utils').set_global(require('constants').GLOBALS.IS_LINTING, false)
    vim.diagnostic.hide()
  end)

  require('utils').create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = require('utils').create_augroup('toggle-linter'),
    callback = lint,
  })
end

return M
