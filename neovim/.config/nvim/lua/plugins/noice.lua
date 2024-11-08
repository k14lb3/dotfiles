-- ┏━━━━━━━┓
-- ┃ noice ┃
-- ┗━━━━━━━┛

local M = {}

M[1] = 'folke/noice.nvim'

M.dependencies = {
  'MunifTanjim/nui.nvim',
  'nvim-telescope/telescope.nvim',
}

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymap('n', '<Leader>fm', function() require('noice').cmd('telescope') end)
end

M.opts = function()
  return {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
      hover = {
        silent = true,
      },
      documentation = {
        opts = {
          border = {
            style = 'single',
          },
        },
      },
    },
    presets = {
      bottom_search = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
    popupmenu = {
      backend = 'cmp',
    },
    cmdline = {
      opts = {
        border = {
          style = 'single',
        },
      },
      format = {
        cmdline = {
          opts = {
            border = {
              text = {
                top = '',
              },
            },
          },
        },
        search_down = {
          opts = {
            border = {
              style = 'none',
            },
          },
        },
        search_up = {
          opts = {
            border = {
              style = 'none',
            },
          },
        },
        IncRename = {
          opts = {
            border = {
              text = {
                top = '',
              },
            },
          },
        },
      },
    },
  }
end

return M
