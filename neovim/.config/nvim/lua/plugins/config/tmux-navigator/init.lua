local setup = function()
  local g = vim.g

  g.tmux_navigator_no_mappings = 1
end

local config = function()
  require 'plugins.config.tmux-navigator.mappings'
end

return {
  setup = setup,
  config = config,
}
