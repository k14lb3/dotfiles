local settings = {
  style = 'night',
  transparent = true,
  transparent_sidebar = true,
  colors = {
    bg_float = 'none',
  },
}

for k, v in pairs(settings) do
  vim.api.nvim_set_var('tokyonight_' .. k, v)
end

vim.api.nvim_command 'colorscheme tokyonight'
