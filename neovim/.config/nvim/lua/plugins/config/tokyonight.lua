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
      -- Core
      hl.CmpPmenu = {
        bg = 'none',
        fg = c.border_highlight,
      }
      hl.FloatBorder = {
        fg = c.blue,
      }
      hl.NormalFloat = {
        fg = c.blue,
      }
      hl.PmenuThumb = {
        bg = c.blue,
      }
      -- Alpha
      hl.AlphaHeaderLabel = {
        fg = c.blue,
      }
      -- Telescope
      hl.TelescopeBorder = {
        fg = c.blue,
      }
      hl.TelescopePromptBorder = {
        fg = c.blue,
      }
    end,
  }

  vim.api.nvim_command 'colorscheme tokyonight'
end

return {
  config = config,
}
