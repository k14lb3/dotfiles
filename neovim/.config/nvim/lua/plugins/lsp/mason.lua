-- ┏━━━━━━━┓
-- ┃ mason ┃
-- ┗━━━━━━━┛

local M = {}

M[1] = 'williamboman/mason.nvim'

M.build = ':MasonUpdate'

M.event = 'VeryLazy'

M.init = function() require('utils').set_keymap('n', '<Leader>m', require('mason.ui').open) end

M.opts = function()
  return {
    mason = {
      ui = {
        border = 'single',
        icons = {
          package_installed = require('constants').ICONS.CHECK,
          package_uninstalled = require('constants').ICONS.X,
          package_pending = require('constants').ICONS.PENDING,
        },
      },
    },
    mason_registry_refresh_callback = function()
      for _, tool in ipairs(require('utils').concat(require('constants').FORMATTERS, require('constants').LINTERS)) do
        repeat
          local ok, pkg = pcall(require('mason-registry').get_package, tool)

          if not ok then break end

          if pkg:is_installed() then break end

          pkg:install()
        until true
      end
    end,
  }
end

M.config = function(_, opts)
  require('mason').setup(opts.mason)
  require('mason-registry').refresh(opts.mason_registry_refresh_callback)
end

return M
