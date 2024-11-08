-- ┏━━━━━━━━━┓
-- ┃ plugins ┃
-- ┗━━━━━━━━━┛

if not require('utils').get_global(require('constants').GLOBALS.IS_LAZY_LOADED) then
  require('utils').set_global(require('constants').GLOBALS.IS_LAZY_LOADED, true)

  local lazy_directory_path = string.format('%s/lazy/lazy.nvim', vim.fn.stdpath('data'))

  if not require('utils').is_file_existing(lazy_directory_path) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazy_directory_path,
    })
  end

  require('utils').get_option('rtp'):prepend(lazy_directory_path)

  require('lazy').setup('plugins', {
    defaults = {
      lazy = true,
    },
    install = {
      colorscheme = {
        'lackluster',
      },
    },
    ui = {
      border = 'single',
      backdrop = 100,
    },
    change_detection = {
      notify = false,
    },
    performance = {
      rtp = {
        disabled_plugins = {
          'gzip',
          'matchit',
          'matchparen',
          'netrwPlugin',
          'tarPlugin',
          'tohtml',
          'tutor',
          'zipPlugin',
        },
      },
    },
  })

  require('utils').set_keymap('n', '<Leader>l', '<Cmd>Lazy<CR>')
end

local M = {
  'folke/lazy.nvim',
}

return M
