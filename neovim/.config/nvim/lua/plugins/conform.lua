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
        'deno_fmt',
      },
      html = {
        'prettierd',
        'deno_fmt',
      },
      javascript = {
        'prettierd',
        'deno_fmt',
      },
      javascriptreact = {
        'prettierd',
        'deno_fmt',
      },
      json = {
        'prettierd',
        'deno_fmt',
      },
      lua = {
        'stylua',
      },
      markdown = {
        'prettierd',
        'deno_fmt',
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
        'deno_fmt',
      },
      typescript = {
        'prettierd',
        'deno_fmt',
      },
      typescriptreact = {
        'prettierd',
        'deno_fmt',
      },
      yaml = {
        'prettierd',
        'deno_fmt',
      },
    },
    formatters = {
      deno_fmt = {
        -- https://docs.deno.com/runtime/fundamentals/configuration/
        cwd = require('conform.util').root_file({ 'deno.json', 'deno.jsonc' }),
        require_cwd = true,
        -- https://docs.deno.com/runtime/reference/cli/formatter/#formatting-options
        args = function()
          return {
            'fmt',
            '-',
            '--ext',
            vim.fn.expand('%:e'),
          }
        end,
      },
      shfmt = {
        -- https://github.com/mvdan/sh/blob/master/cmd/shfmt/shfmt.1.scd
        append_args = {
          '--case-indent',
        },
      },
      stylua = {
        -- https://github.com/JohnnyMorganz/StyLua?tab=readme-ov-file#options
        append_args = function(self, context)
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
        -- https://docs.deno.com/runtime/fundamentals/configuration/
        condition = function(self, context)
          return not require('conform.util').root_file({ 'deno.json', 'deno.jsonc' })(self, context)
        end,
        -- https://prettier.io/docs/en/options.html
        append_args = function(self, context)
          if require('conform.formatters.prettierd').cwd(self, context) then return {} end

          return {
            '--single-quote=true',
            '--jsx-single-quote=true',
          }
        end,
      },
      ['clang-format'] = {
        -- https://clang.llvm.org/docs/ClangFormat.html
        append_args = {
          '--style=google',
        },
      },
      yapf = {
        -- https://github.com/google/yapf?tab=readme-ov-file#formatting-style
        append_args = {
          '--style',
          'google',
        },
      },
    },
  }
end

return M
