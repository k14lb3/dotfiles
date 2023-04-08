local config = function()
  require 'plugins.config.tree.settings'
  require 'plugins.config.tree.mappings'
  require 'plugins.config.tree.autocmds'
end

return {
  config = config,
}
