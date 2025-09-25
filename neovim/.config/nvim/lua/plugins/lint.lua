-- ┏━━━━━━┓
-- ┃ lint ┃
-- ┗━━━━━━┛

local M = {}

M[1] = 'mfussenegger/nvim-lint'

M.event = 'VeryLazy'

M.opts = function()
  return {
    linters_by_ft = {
      javascript = {
        'biomejs',
        'eslint_d',
      },
      javascriptreact = {
        'biomejs',
        'eslint_d',
      },
      python = {
        'ruff',
      },
      typescript = {
        'biomejs',
        'eslint_d',
      },
      typescriptreact = {
        'biomejs',
        'eslint_d',
      },
    },
    linter_root_markers = {
      biomejs = require('constants').ROOT_MARKERS.BIOME,
      eslint_d = require('constants').ROOT_MARKERS.ESLINT,
      ruff = require('constants').ROOT_MARKERS.RUFF,
    },
  }
end

M.config = function(_, opts)
  require('lint').linters_by_ft = opts.linters_by_ft

  local lint = function()
    if not require('utils').get_global(require('constants').GLOBALS.IS_LINTING) then return end

    local linters = opts.linters_by_ft[vim.bo.filetype]

    if not linters then return end

    for _, name in pairs(linters) do
      repeat
        local root_markers = opts.linter_root_markers[name]

        if not root_markers then break end

        if not require('utils').is_file_in_root(opts.linter_root_markers[name]) then break end

        require('lint').try_lint(name)
        return
      until true
    end
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
