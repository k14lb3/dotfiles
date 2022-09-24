local config = function()
  local colorizer = require 'colorizer'

  colorizer.setup({ '*' }, {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = false,
    css_fn = false,
  })
end

return {
  config = config,
}
