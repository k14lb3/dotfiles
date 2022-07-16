local config = function()
  require 'plugins.config.bufferline.settings'
  require 'plugins.config.bufferline.mappings'
end

return {
  tag = 'v2.*',
  config = config,
}
