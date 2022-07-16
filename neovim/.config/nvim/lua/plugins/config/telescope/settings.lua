local telescope = require 'telescope'
local telescope_previewers = require 'telescope.previewers'
local telescope_sorters = require 'telescope.sorters'
local telescope_actions = require 'telescope.actions'
local telescope_trouble_provider = require 'trouble.providers.telescope'

telescope.setup {
  defaults = {
    sorting_strategy = 'ascending',
    selection_strategy = 'reset',
    layout_strategy = 'flex',
    layout_config = {
      flex = {
        flip_columns = 130,
      },
      horizontal = {
        preview_width = 0.55,
        preview_cutoff = 120,
      },
      vertical = {
        preview_cutoff = 40,
      },
      width = 0.8,
      height = 0.9,
      prompt_position = 'top',
    },
    prompt_prefix = ' ',
    selection_caret = ' ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    path_display = { 'truncate' },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    file_ignore_patterns = { '.git', 'node_modules' },
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
    file_sorter = telescope_sorters.get_fuzzy_file,
    generic_sorter = telescope_sorters.get_generic_fuzzy_sorter,
    file_previewer = telescope_previewers.vim_buffer_cat.new,
    grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
    qflist_previewer = telescope_previewers.vim_buffer_qflist.new,
    buffer_previewer_maker = telescope_previewers.buffer_previewer_maker,
    mappings = {
      i = {
        ['<C-n>'] = false,
        ['<C-p>'] = false,
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<PageUp>'] = false,
        ['<PageDown>'] = false,
        ['<C-h>'] = 'which_key',
        ['<Esc>'] = telescope_actions.close,
        ['<C-[>'] = telescope_actions.close,
        ['<C-t>'] = telescope_trouble_provider.open_with_trouble,
        ['<C-j>'] = telescope_actions.move_selection_next,
        ['<C-k>'] = telescope_actions.move_selection_previous,
        ['<C-o>'] = telescope_actions.select_default,
        ['<C-y>'] = telescope_actions.preview_scrolling_up,
        ['<C-e>'] = telescope_actions.preview_scrolling_down,
        ['<Tab>'] = telescope_actions.toggle_selection + telescope_actions.move_selection_worse,
        ['<S-Tab>'] = telescope_actions.toggle_selection + telescope_actions.move_selection_better,
        ['<C-q>'] = telescope_actions.send_to_qflist + telescope_actions.open_qflist,
        ['<M-q>'] = telescope_actions.send_selected_to_qflist + telescope_actions.open_qflist,
        ['<C-l>'] = telescope_actions.complete_tag,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      only_sort_text = true,
    },
  },
  extensions = {},
}
