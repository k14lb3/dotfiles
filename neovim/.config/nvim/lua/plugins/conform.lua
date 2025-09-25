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
        'biome-check',
        'prettierd',
      },
      html = {
        'biome-check',
        'prettierd',
      },
      javascript = {
        'biome-check',
        'prettierd',
      },
      javascriptreact = {
        'biome-check',
        'prettierd',
      },
      json = {
        'biome-check',
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
        'biome-check',
        'prettierd',
      },
      typescript = {
        'biome-check',
        'prettierd',
      },
      typescriptreact = {
        'biome-check',
        'prettierd',
      },
      yaml = {
        'biome-check',
        'prettierd',
      },
    },
    formatters = {
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
      ['biome-check'] = {
        require_cwd = true,
      },
      prettierd = {
        condition = function(self, context)
          -- https://github.com/stevearc/conform.nvim/blob/b4aab989db276993ea5dcb78872be494ce546521/lua/conform/formatters/biome-check.lua#L11-L14
          if require('conform.formatters.biome-check').cwd(self, context) then return false end

          return true
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
