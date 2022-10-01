local lspconfig = require 'lspconfig'
local mason_lspconfig = require 'mason-lspconfig'
local servers = require 'plugins.config.lsp.servers'
local handlers = require 'plugins.config.lsp.handlers'

mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local servers_path = 'plugins.config.lsp.servers'
local opts = {}

mason_lspconfig.setup_handlers {
  function(server)
    opts = {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    }

    if server == 'sumneko_lua' then
      local _opts = require(servers_path .. '.sumneko_lua')
      opts = vim.tbl_deep_extend('force', _opts, opts)
    end

    lspconfig[server].setup(opts)
  end,
}
