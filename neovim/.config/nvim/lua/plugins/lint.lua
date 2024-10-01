-- ┏━━━━━━┓
-- ┃ lint ┃
-- ┗━━━━━━┛

local M = {}

M[1] = 'mfussenegger/nvim-lint'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymap('n', '<Leader>tl', function()
    if not require('utils').get_global(require('constants').GLOBALS.IS_LINTING) then
      require('utils').set_global(require('constants').GLOBALS.IS_LINTING, true)
      require('lint').try_lint()
      vim.notify('Linter enabled', vim.log.levels.INFO)
      return
    end

    require('utils').set_global(require('constants').GLOBALS.IS_LINTING, false)
    vim.diagnostic.hide()
    vim.notify('Linter disabled', vim.log.levels.INFO)
  end)

  require('utils').create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = require('utils').create_augroup('toggle-linter'),
    callback = function()
      if not require('utils').get_global(require('constants').GLOBALS.IS_LINTING) then return end

      require('lint').try_lint()
    end,
  })
end

M.opts = function()
  return {
    linters_by_ft = {
      sh = {
        'shellcheck',
      },
      javascript = {
        'eslint_d',
      },
      javascriptreact = {
        'eslint_d',
      },
      json = {
        'eslint_d',
      },
      lua = {
        'selene',
      },
      python = {
        'ruff',
      },
      typescript = {
        'eslint_d',
      },
      typescriptreact = {
        'eslint_d',
      },
    },
  }
end

M.config = function(_, opts) require('lint').linters_by_ft = opts.linters_by_ft end

return M
