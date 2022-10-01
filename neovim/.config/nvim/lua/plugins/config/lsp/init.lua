local config = function()
  require 'plugins.config.lsp.mason'
  require 'plugins.config.lsp.config'
  require 'plugins.config.lsp.signature'
  require('plugins.config.lsp.handlers').setup()
  require 'plugins.config.lsp.null'
end

return {
  config = config,
}
