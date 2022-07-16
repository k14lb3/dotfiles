local lsp_signature = require 'lsp_signature'

lsp_signature.setup {
  debug = false,
  log_path = vim.fn.stdpath 'cache' .. '/lsp_signature.log',
  verbose = false,
  bind = false,
  doc_lines = 10,
  floating_window = true,
  floating_window_above_cur_line = false,
  floating_window_off_x = 1,
  floating_window_off_y = 0,
  fix_pos = false,
  hint_enable = false,
  max_height = 12,
  max_width = 80,
  handler_opts = {
    border = 'rounded',
  },
  always_trigger = false,
  auto_close_after = nil,
  extra_trigger_chars = {},
  zindex = 200,
  padding = ' ',
  transparency = 100,
  timer_interval = 200,
  toggle_key = nil,
}
