-- ┏━━━━━━━━━━┓
-- ┃ opencode ┃
-- ┗━━━━━━━━━━┛

local M = {}

M[1] = 'sudo-tee/opencode.nvim'

M.event = 'VeryLazy'

M.dependencies = {
  'nvim-lua/plenary.nvim',
  'MeanderingProgrammer/render-markdown.nvim',
  'hrsh7th/nvim-cmp',
  'nvim-telescope/telescope.nvim',
}

M.opts = {
  preferred_picker = 'telescope',
  preferred_completion = 'nvim-cmp',
  default_mode = 'build',
  keymap = {
    editor = {
      ['<leader>og'] = false,
      ['<Char-0x1e>'] = { 'toggle' },
      ['<leader>oi'] = false,
      ['<leader>.'] = { 'open_input' },
      ['<leader>oI'] = false,
      ['<leader>.I'] = { 'open_input_new_session' },
      ['<leader>oo'] = false,
      ['<leader>oT'] = false,
      ['<leader>.t'] = { 'timeline' },
      ['<leader>oq'] = false,
      ['<leader>os'] = false,
      ['<leader>oR'] = false,
      ['<leader>op'] = false,
      ['<leader>oV'] = false,
      ['<leader>oy'] = false,
      ['<leader>.a'] = { 'add_visual_selection_inline', mode = { 'v' } },
      ['<leader>oY'] = false,
      ['<leader>.A'] = { 'add_visual_selection', { open_input = false }, mode = { 'v' } },
      ['<leader>oz'] = false,
      ['<leader>.z'] = { 'toggle_zoom' },
      ['<leader>ov'] = false,
      ['<leader>od'] = false,
      ['<leader>.d'] = { 'diff_open' },
      ['<leader>o]'] = false,
      ['<leader>.]'] = { 'diff_next' },
      ['<leader>o['] = false,
      ['<leader>.['] = { 'diff_prev' },
      ['<leader>oc'] = false,
      ['<leader>ora'] = false,
      ['<leader>ort'] = false,
      ['<leader>orA'] = false,
      ['<leader>orT'] = false,
      ['<leader>orr'] = false,
      ['<leader>.r'] = { 'diff_restore_snapshot_file' },
      ['<leader>orR'] = false,
      ['<leader>.R'] = { 'diff_restore_snapshot_all' },
      ['<leader>ox'] = false,
      ['<leader>ott'] = false,
      ['<leader>otr'] = false,
      ['<leader>o/'] = false,
    },
    input_window = {
      ['<esc>'] = false,
      ['@'] = { 'mention', mode = 'i' },
      ['/'] = { 'slash_commands', mode = 'i' },
      ['#'] = { 'context_items', mode = 'i' },
      ['<C-v>'] = { 'paste_image', mode = { 'n', 'i' } },
      ['<tab>'] = { 'switch_mode' },
      ['<C-f>'] = { 'select_session', mode = { 'n', 'i' } },
      ['<C-o>'] = { 'configure_provider', mode = { 'n', 'i' } },
      ['<C-e>'] = { 'cycle_variant', mode = { 'n', 'i' } },
      ['<C-n>'] = { 'open_input_new_session', mode = { 'n', 'i' } },
    },
    output_window = {
      ['<esc>'] = false,
      ['<tab>'] = false,
      ['<leader>oS'] = false,
      ['<leader>oD'] = false,
      ['<C-m>'] = { 'debug_message' },
      ['<leader>oO'] = false,
      ['<C-o>'] = { 'debug_output' },
      ['<leader>ods'] = false,
      ['<C-s>'] = { 'debug_session' },
      ['<C-n>'] = { 'open_input_new_session', mode = { 'n', 'i' } },
    },
  },
  ui = {
    input = {
      text = {
        wrap = true,
      },
    },
  },
}

return M
