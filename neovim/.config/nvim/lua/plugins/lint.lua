-- ┏━━━━━━┓
-- ┃ lint ┃
-- ┗━━━━━━┛

local M = {}

M[1] = 'mfussenegger/nvim-lint'

M.event = 'VeryLazy'

M.init = function()
  local lint = function()
    if not require('utils').get_global(require('constants').GLOBALS.IS_LINTING) then return end

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

M.opts = function()
  return {
    linters_by_ft = {
      javascript = {
        'eslint_d',
        'deno',
      },
      javascriptreact = {
        'eslint_d',
        'deno',
      },
      json = {
        'eslint_d',
        'deno',
      },
      python = {
        'ruff',
      },
      typescript = {
        'eslint_d',
        'deno',
      },
      typescriptreact = {
        'eslint_d',
        'deno',
      },
    },
  }
end

M.config = function(_, opts) require('lint').linters_by_ft = opts.linters_by_ft end

return M
