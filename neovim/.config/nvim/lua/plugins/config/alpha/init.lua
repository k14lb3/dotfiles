local config = function()
  local alpha = require 'alpha'
  local utils = require 'plugins.config.alpha.utils'

  local header = {
    type = 'text',
    val = utils.ascii.art.wojak,
    opts = {
      position = 'center',
      hl = 'AlphaHeader',
    },
  }

  local header_label = {
    type = 'text',
    val = utils.ascii.text.i_suck_at_coding_bro,
    opts = {
      position = 'center',
      hl = 'AlphaHeaderLabel',
    },
  }

  local buttons = {
    type = 'group',
    val = {
      utils.button('<leader> f f', '  Find File            ', ':Telescope find_files<CR>'),
      utils.button('<leader> f o', '  Recently Opened Files', ':Telescope oldfiles<CR>'),
      utils.button('<leader> f g', '  Find Word            ', ':Telescope live_grep<CR>'),
      utils.button('           c', '  Configuration        ', ':e $MYVIMRC | :cd %:p:h <CR>'),
      utils.button('           q', '  Quit                 ', ':qa<CR>'),
    },
    opts = {
      spacing = 1,
    },
  }

  local footer = {
    type = 'text',
    val = utils.quote,
    opts = {
      position = 'center',
      hl = 'AlphaFooter',
    },
  }
  local padding = function(val)
    return {
      type = 'padding',
      val = val,
    }
  end
  alpha.setup {
    layout = {
      padding(2),
      header,
      padding(1),
      header_label,
      padding(2),
      buttons,
      padding(1),
      footer,
    },
    opts = {},
  }
end

return {
  config = config,
}
