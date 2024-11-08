-- ┏━━━━━┓
-- ┃ oil ┃
-- ┗━━━━━┛

local M = {}

M[1] = 'stevearc/oil.nvim'

M.dependencies = {
  'nvim-tree/nvim-web-devicons',
}

M.lazy = false

M.init = function()
  require('utils').set_keymaps(
    { 'n', '-', require('oil').open },
    { 'n', '_', function() require('oil').open(vim.fn.getcwd()) end }
  )
end

M.opts = function()
  return {
    delete_to_trash = true,
    experimental_watch_for_changes = true,
    cleanup_delay_ms = 0,
    keymaps = {
      ['<C-s>'] = false,
      ['<C-h>'] = false,
      ['<C-t>'] = false,
      ['<C-c>'] = false,
      ['<C-l>'] = false,
      ['<Leader>y'] = function()
        require('oil.actions').yank_entry.callback({ modify = ':t:r' })
        vim.notify('Filename copied to clipboard.')
      end,
      ['<Leader>Y'] = function()
        require('oil.actions').yank_entry.callback({ modify = ':.' })
        vim.notify('Filepath copied to clipboard.')
      end,
      ['gx'] = function()
        local cursor_entry = require('oil').get_cursor_entry()

        if not cursor_entry then return end

        local current_directory = require('oil').get_current_dir()

        if not current_directory then return end

        local filepath = string.format('%s%s', current_directory, cursor_entry.name)

        if not filepath then return end

        if require('utils').is_matching_any_pattern(require('constants').PATTERNS.IMAGE, filepath) then
          require('utils').execute(string.format('%s %s', require('constants').APPLICATION.IMAGE_VIEWER, filepath))
          return
        end

        if require('utils').is_matching_any_pattern(require('constants').PATTERNS.VIDEO, filepath) then
          require('utils').execute(string.format('%s %s', require('constants').APPLICATION.VIDEO_PLAYER, filepath))
          return
        end

        require('oil.actions').open_external.callback()
      end,
      ['<Leader>|'] = {
        'actions.select',
        opts = {
          vertical = true,
        },
      },
      ['<Leader>_'] = {
        'actions.select',
        opts = {
          horizontal = true,
        },
      },
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        if name == '..' then return true end

        return false
      end,
    },
    ssh = {
      border = 'single',
    },
    keymaps_help = {
      border = 'single',
    },
  }
end

return M
