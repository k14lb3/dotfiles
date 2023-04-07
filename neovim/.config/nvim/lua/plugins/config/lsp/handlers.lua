local M = {}
local cmp_nvim_lsp = require 'cmp_nvim_lsp'

local null_ls_format = function(bufnr)
  return function()
    vim.lsp.buf.format {
      timeout_ms = 2000,
      filter = function(client)
        return client.name == 'null-ls'
      end,
      bufnr = bufnr,
    }
  end
end

local lsp_mappings = function(bufnr)
  local buf_map = require('core.utils').buf_map

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  buf_map(bufnr, 'n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
  buf_map(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  buf_map(bufnr, 'n', 'gK', ':lua vim.lsp.buf.signature_help()<CR>')
  buf_map(bufnr, 'n', 'gk', ':lua vim.lsp.buf.hover()<CR>')
  buf_map(bufnr, 'n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
  buf_map(bufnr, 'n', 'gT', ':lua vim.lsp.buf.type_definition()<CR>')
  buf_map(bufnr, 'n', 'gR', ':lua vim.lsp.buf.references()<CR>')
  buf_map(bufnr, 'n', 'gr', ':lua vim.lsp.buf.rename()<CR>')
  buf_map(bufnr, 'n', 'ga', ':lua vim.lsp.buf.code_action()<CR>')
  buf_map(bufnr, 'n', '<leader>f', null_ls_format(bufnr))
  buf_map(bufnr, 'n', '[d', ':lua vim.diagnostic.goto_prev()<CR>')
  buf_map(bufnr, 'n', 'gl', ':lua vim.diagnostic.open_float()<CR>')
  buf_map(bufnr, 'n', ']d', ':lua vim.diagnostic.goto_next()<CR>')
  buf_map(bufnr, 'n', 'gq', ':lua vim.diagnostic.setloclist()<CR>')
end

local lsp_diagnostics = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
  }

  for _, sign in pairs(signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name })
  end

  local config = {
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)
end

local lsp_highlighting = function(bufnr)
  vim.api.nvim_create_augroup('lsp_document_highlight', {
    clear = false,
  })

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    buffer = bufnr,
    group = 'lsp_document_highlight',
    callback = vim.lsp.buf.document_highlight,
  })

  vim.api.nvim_create_autocmd('CursorMoved', {
    buffer = bufnr,
    group = 'lsp_document_highlight',
    callback = vim.lsp.buf.clear_references,
  })
end

M.setup = function()
  lsp_diagnostics()

  local win_float = require 'lspconfig.ui.windows'
  local default_opts_ = win_float.default_opts

  win_float.default_opts = function(opts)
    local opts_ = default_opts_(opts)
    opts_.border = 'rounded'
    return opts_
  end

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

M.on_attach = function(client, bufnr)
  lsp_mappings(bufnr)

  if client.server_capabilities.documentHighlightProvider then
    lsp_highlighting(bufnr)
  end
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
