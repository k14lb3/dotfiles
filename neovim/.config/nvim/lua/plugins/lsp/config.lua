-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'neovim/nvim-lspconfig'

M.dependencies = {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
}

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymap('n', '<Leader>li', require('lspconfig.ui.lspinfo'))
  require('utils').create_autocmd({ 'LspAttach' }, {
    callback = function(event)
      require('utils').set_buffer_keymaps(
        event.buf,
        { 'n', 'K', vim.lsp.buf.hover },
        { 'n', 'gd', require('telescope.builtin').lsp_definitions },
        { 'n', 'gD', vim.lsp.buf.declaration },
        { 'n', 'gr', require('telescope.builtin').lsp_references },
        { 'n', 'gi', require('telescope.builtin').lsp_implementations },
        { 'n', 'gt', require('telescope.builtin').lsp_type_definitions },
        { { 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action },
        { 'n', '<Leader>ds', require('telescope.builtin').lsp_document_symbols },
        { 'n', '<Leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols }
      )
    end,
  })
end

M.opts = function()
  return {
    mason_lspconfig = {
      ensure_installed = require('utils').get_named_keys_and_indexed_values(require('constants').LANGUAGE_SERVERS),
      handlers = {
        function(server)
          local has_cmp = pcall(require, 'cmp')
          local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
          local options = require('constants').LANGUAGE_SERVERS[server] or {}

          options = vim.tbl_deep_extend('force', {
            capabilities = vim.lsp.protocol.make_client_capabilities(),
          }, options)

          if has_cmp and has_cmp_nvim_lsp then
            options.capabilities =
              vim.tbl_deep_extend('force', options.capabilities, cmp_nvim_lsp.default_capabilities())
          end

          require('lspconfig')[server].setup(options)
        end,
      },
    },
    vim_diagnostic = {
      severity_sort = true,
      virtual_text = {
        prefix = function(diagnostic)
          for severity, icon in pairs({
            ERROR = require('constants').ICONS.ERROR,
            WARN = require('constants').ICONS.WARN,
            HINT = require('constants').ICONS.HINT,
            INFO = require('constants').ICONS.INFO,
          }) do
            repeat
              if diagnostic.severity ~= vim.diagnostic.severity[severity] then break end

              return icon
            until true
          end
        end,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = require('constants').ICONS.ERROR,
          [vim.diagnostic.severity.WARN] = require('constants').ICONS.WARN,
          [vim.diagnostic.severity.HINT] = require('constants').ICONS.HINT,
          [vim.diagnostic.severity.INFO] = require('constants').ICONS.INFO,
        },
      },
    },
    lspconfig_ui_windows_border = 'single',
  }
end

M.config = function(_, opts)
  require('mason-lspconfig').setup(opts.mason_lspconfig)
  vim.diagnostic.config(opts.vim_diagnostic)
  require('lspconfig.ui.windows').default_options.border = opts.lspconfig_ui_windows_border
end

return M
