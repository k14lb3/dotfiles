local config = function()
  local tokyonight = require 'tokyonight'

  tokyonight.setup {
    style = 'night',
    transparent = true,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = 'transparent',
      floats = 'transparent',
    },
    hide_inactive_statusline = true,
    lualine_bold = true,
    on_highlights = function(hl, c)
      hl.CmpPmenu = {
        bg = 'none',
        fg = c.border_highlight,
      }

      hl.PmenuThumb = {
        bg = c.blue,
      }

      hl.AlphaHeaderLabel = {
        fg = c.blue,
      }
    end,
  }

  vim.api.nvim_command 'colorscheme tokyonight'
end

return {
  config = config,
}
