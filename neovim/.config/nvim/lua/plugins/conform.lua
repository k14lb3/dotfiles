-- ┏━━━━━━━━━┓
-- ┃ conform ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'stevearc/conform.nvim'

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    { 'n', '<Leader>ci', require('conform.health').show_window },
    { 'n', '<Leader>f', function() require('conform').format({ async = true }) end }
  )
end

M.opts = function()
  return {
    notify_on_error = false,
    default_format_opts = {
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      c = {
        'clang-format',
      },
      cpp = {
        'clang-format',
      },
      sh = {
        'shfmt',
      },
      zsh = {
        'shfmt',
      },
      css = {
        'prettierd',
      },
      html = {
        'prettierd',
      },
      javascript = {
        'prettierd',
      },
      javascriptreact = {
        'prettierd',
      },
      json = {
        'prettierd',
      },
      lua = {
        'stylua',
      },
      markdown = {
        'prettierd',
      },
      mdx = {
        'prettierd',
      },
      python = {
        'isort',
        'yapf',
      },
      scss = {
        'prettierd',
      },
      typescript = {
        'prettierd',
      },
      typescriptreact = {
        'prettierd',
      },
      yaml = {
        'prettierd',
      },
    },
    formatters = {
      shfmt = {
        -- https://github.com/mvdan/sh/blob/master/cmd/shfmt/shfmt.1.scd
        prepend_args = {
          '--case-indent',
        },
      },
      stylua = {
        -- https://github.com/JohnnyMorganz/StyLua?tab=readme-ov-file#options
        prepend_args = function(self, context)
          if require('conform.formatters.stylua').cwd(self, context) then return {} end

          return {
            '--indent-type',
            'Spaces',
            '--indent-width',
            '2',
            '--quote-style',
            'AutoPreferSingle',
            '--collapse-simple-statement',
            'Always',
          }
        end,
      },
      prettierd = {
        -- https://prettier.io/docs/en/options.html
        prepend_args = function(self, context)
          if require('conform.formatters.prettierd').cwd(self, context) then return {} end

          return { '--single-quote=true', '--jsx-single-quote=true' }
        end,
      },
      ['clang-format'] = {
        -- https://clang.llvm.org/docs/ClangFormat.html
        prepend_args = { '--style=google' },
      },
      yapf = {
        -- https://github.com/google/yapf?tab=readme-ov-file#formatting-style
        prepend_args = function(self, context)
          if require('conform.formatters.yapf').cwd(self, context) then return {} end

          return { '--style', 'google' }
        end,
      },
    },
  }
end

return M
