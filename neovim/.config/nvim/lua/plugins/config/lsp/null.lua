local null_ls = require 'null-ls'
local null_ls_sources = require 'null-ls.sources'
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local eslint_config_file_formats = {
  -- https://eslint.org/docs/latest/user-guide/configuring/configuration-files-new#configuration-file
  'eslint.config.js',
  -- https://eslint.org/docs/user-guide/configuring/configuration-files#configuration-file-formats
  '.eslintrc',
  '.eslintrc.js',
  '.eslintrc.cjs',
  '.eslintrc.yaml',
  '.eslintrc.yml',
  '.eslintrc.json',
}

local prettier_config_file_formats = {
  -- https://prettier.io/docs/en/configuration.html
  '.prettierrc',
  '.prettierrc.json',
  '.prettierrc.yml',
  '.prettierrc.yaml',
  '.prettierrc.json5',
  '.prettierrc.js',
  '.prettierrc.cjs',
  '.prettier.config.js',
  '.prettier.config.cjs',
  '.prettierrc.toml',
}

null_ls.setup {
  sources = {
    code_actions.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file(eslint_config_file_formats)
      end,
    },
    diagnostics.flake8,
    diagnostics.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file(eslint_config_file_formats)
      end,
    },
    formatting.beautysh,
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
    formatting.prettierd.with {
      condition = function(utils)
        return utils.root_has_file(prettier_config_file_formats)
      end,
    },
    formatting.eslint_d.with {
      -- Only register eslint_d if prettierd is not running as a formatter
      condition = function(utils)
        return utils.root_has_file(eslint_config_file_formats)
          and #null_ls_sources.get { name = 'prettierd', method = null_ls.methods.FORMATTING } == 0
      end,
    },
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
  },
}
