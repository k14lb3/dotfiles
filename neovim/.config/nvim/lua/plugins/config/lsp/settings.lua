local lspconfig = require 'lspconfig'
local servers = require 'plugins.config.lsp.servers'
local handlers = require 'plugins.config.lsp.handlers'

local servers_path = 'plugins.config.lsp.servers'
local opts = {}

for _, server in pairs(servers) do
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
end
