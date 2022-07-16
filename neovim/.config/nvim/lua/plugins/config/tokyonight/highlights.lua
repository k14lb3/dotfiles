local colors = require('tokyonight.colors').setup()
local hl = vim.api.nvim_set_hl

hl(0, 'CmpPmenu', {
  bg = 'none',
  fg = colors.border_highlight,
})

hl(0, 'PmenuThumb', {
  bg = colors.blue,
})

hl(0, 'AlphaHeader', {
  fg = colors.blue,
})

hl(0, 'AlphaHeaderLabel', {
  fg = colors.blue,
})

hl(0, 'AlphaButtons', {
  fg = colors.magenta,
})

hl(0, 'AlphaShortcut', {
  fg = colors.cyan,
})

hl(0, 'AlphaFooter', {
  fg = colors.yellow,
  italic = true,
})
