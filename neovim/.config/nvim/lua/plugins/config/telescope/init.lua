local config = function()
  require 'plugins.config.telescope.settings'
  require 'plugins.config.telescope.mappings'
end

return {
  config = config,
}
