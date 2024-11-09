-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'neovim/nvim-lspconfig'

M.dependencies = {
  'folke/noice.nvim',
  'hrsh7th/nvim-cmp',
  'williamboman/mason.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
}

M.lazy = false

M.init = function()
  require('utils').create_autocmd({ 'LspAttach' }, {
    callback = function(event)
      require('utils').set_buffer_keymaps(
        event.buf,
        { 'n', 'K', require('noice.lsp').hover },
        { 'n', 'gd', require('telescope.builtin').lsp_definitions },
        { 'n', 'gD', vim.lsp.buf.declaration },
        { 'n', 'gr', require('telescope.builtin').lsp_references },
        { 'n', 'gi', require('telescope.builtin').lsp_implementations },
        { 'n', 'gt', require('telescope.builtin').lsp_type_definitions },
        { 'n', 'gl', function() vim.diagnostic.open_float({ header = '', border = 'single' }) end },
        { 'n', '[x', function() vim.diagnostic.jump({ count = 1 }) end },
        { 'n', ']x', function() vim.diagnostic.jump({ count = -1 }) end },
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
      ensure_installed = require('utils').get_table_keys(require('constants').LANGUAGE_SERVERS),
      handlers = {
        function(server)
          local options = require('constants').LANGUAGE_SERVERS[server] or {}

          if require('utils').is_function(options) then options = options(require('lspconfig')) end

          options = vim.tbl_deep_extend('force', {
            capabilities = vim.tbl_deep_extend(
              'force',
              vim.lsp.protocol.make_client_capabilities(),
              require('cmp_nvim_lsp').default_capabilities()
            ),
          }, options)

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

  require('lspconfig').sourcekit.setup({
    capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities(),
      {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      }
    ),
    cmd = { 'sourcekit-lsp' },
    filetypes = { 'swift', 'objc', 'objcpp', 'c', 'cpp' },
    root_dir = function(filename, _)
      return require('lspconfig.util').root_pattern('buildServer.json')(filename)
        or require('lspconfig.util').root_pattern('.xcodeproj', '.xcworkspace')(filename)
        or require('lspconfig.util').root_pattern('compile_commands.json', 'Package.swift')(filename)
        or require('lspconfig.util').find_git_ancestor(filename)
    end,
    get_language_id = function(_, filetype)
      local filetypes = { objc = 'objective-c', objcpp = 'objective-cpp' }
      return filetypes[filetype] or filetype
    end,
    on_init = function(client) client.offset_encoding = 'utf-8' end,
  })
end

return M
