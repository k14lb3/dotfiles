local config = function()
  local notify = require 'notify'
  local telescope = require 'telescope'

  notify.setup {
    level = vim.log.levels.INFO,
    timeout = 5000,
    max_width = nil,
    max_height = nil,
    stages = 'fade_in_slide_out',
    render = 'minimal',
    background_colour = '#000000',
    on_open = nil,
    on_close = nil,
    minimum_width = 50,
    fps = 30,
    icons = {
      ERROR = '',
      WARN = '',
      INFO = '',
      DEBUG = '',
      TRACE = '✎',
    },
  }

  telescope.load_extension 'notify'
  vim.notify = notify
end

return {
  config = config,
}
