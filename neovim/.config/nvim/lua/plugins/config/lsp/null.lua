local null_ls = require 'null-ls'
local null_ls_sources = require 'null-ls.sources'
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  sources = {
    formatting.stylua.with {
      extra_args = {
        '--indent-width',
        '2',
        '--indent-type',
        'Spaces',
        '--quote-style',
        'AutoPreferSingle',
        '--call-parentheses',
        'None',
      },
    },
    code_actions.eslint_d,
    diagnostics.eslint_d,
    formatting.eslint_d.with {
      -- Only register eslint_d if prettierd is not running as a formatter
      condition = function()
        return #null_ls_sources.get { name = 'prettierd' } == 0
      end,
    },
    formatting.prettierd,
    formatting.black.with {
      args = {
        '--stdin-filename',
        '$FILENAME',
        '--quiet',
      },
      exra_args = {
        '--skip-string-normalization',
      },
    },
    diagnostics.flake8,
  },
}
