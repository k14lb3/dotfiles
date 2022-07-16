local config = function()
  local toggleterm = require 'toggleterm'
  local set_terminal_keymaps = function()
    local buf_map = require('core.utils').buf_map
    -- buf_map(0, 't', '<C-[>', '<C-\\><C-n>')
    buf_map(0, 't', '<C-j>', '<C-\\><C-n><C-w>j')
    buf_map(0, 't', '<C-k>', '<C-\\><C-n><C-w>k')
    buf_map(0, 't', '<C-h>', '<C-\\><C-n><C-w>h')
    buf_map(0, 't', '<C-l>', '<C-\\><C-n><C-w>l')
  end

  toggleterm.setup {
    open_mapping = '<C-\\>',
    hide_numbers = true,
    shade_terminals = false,
    insert_mappings = true,
    terminal_mappings = true,
    start_in_insert = true,
    persist_size = true,
    close_on_exit = true,
    direction = 'float',
    float_opts = {
      border = 'curved',
      winblend = 0,
    },
    highlights = {
      NormalFloat = {
        link = 'NormalFloat',
      },
      FloatBorder = {
        link = 'FloatBorder',
      },
    },
  }

  vim.api.nvim_create_autocmd('TermOpen', { pattern = 'term://*', callback = set_terminal_keymaps })
end

return {
  tag = 'v1.*',
  config = config,
}
