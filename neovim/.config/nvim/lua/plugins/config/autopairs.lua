local config = function()
  local autopairs = require 'nvim-autopairs'

  autopairs.setup {
    map_bs = true,
    map_c_h = false,
    map_c_w = false,
    map_cr = true,
    disable_filetype = { 'TelescopePrompt' },
    disable_in_macro = false,
    disable_in_visualblock = false,
    ignored_next_char = [=[[%w%%%'%[%"%.]]=],
    check_ts = true,
    enable_moveright = true,
    enable_afterquote = true,
    enable_check_bracket_line = true,
    enable_bracket_in_quote = true,
    ts_config = {
      lua = { 'string', 'source' },
      javascript = { 'string', 'template_string' },
    },
  }
end

return {
  config = config,
}
