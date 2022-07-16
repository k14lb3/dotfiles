local config = function()
  local colorizer = require 'colorizer'

  -- #f0f
  -- #ff00ffff
  -- Magenta
  -- #ff00ff
  -- rgb(255, 0, 255)
  -- rgba(255, 0, 255, 0.75)
  -- hsl(300, 100%, 50%)
  -- hsla(300, 100%, 50%, 0.75)

  colorizer.setup({ '*' }, {
    RGB = false,
    RRGGBB = false,
    names = false,
    RRGGBBAA = false,
    rgb_fn = false,
    hsl_fn = false,
    css = true,
    css_fn = true,
  })
end

return {
  config = config,
}
