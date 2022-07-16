local config = function()
  require 'plugins.config.lsp.installer'
  require 'plugins.config.lsp.settings'
  require 'plugins.config.lsp.signature'
  require('plugins.config.lsp.handlers').setup()
  require 'plugins.config.lsp.null'
end

return {
  config = config,
}
