-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'nvim-telescope/telescope.nvim'

M.dependencies = {
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope-fzf-native.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-tree/nvim-web-devicons',
}

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_keymaps(
    {
      'n',
      '<Leader>f.',
      function()
      -- stylua: ignore
      local command = string.format('cd %s && git rev-parse --show-toplevel', require('constants').PATH.NVIM_CONFIG_DIRECTORY)
        local handle = io.popen(command)

        if not handle then return end

        local git_root = handle:read('*a')
        handle:close()

        local path = git_root:gsub('%s+$', '')

        if not path then
          vim.notify('Dotfiles directory not found.', vim.log.levels.ERROR)
          return
        end

        require('telescope.builtin').find_files({ cwd = path })
      end,
    },
    { 'n', '<Leader>ff', require('telescope.builtin').find_files },
    { 'n', '<Leader>fo', require('telescope.builtin').oldfiles },
    { 'n', '<Leader>fg', require('telescope.builtin').live_grep },
    { 'n', '<Leader>fw', require('telescope.builtin').grep_string },
    { 'n', '<Leader>fh', require('telescope.builtin').help_tags },
    { 'n', '<Leader>fM', require('telescope.builtin').man_pages },
    { 'n', '<Leader>fj', require('telescope.builtin').jumplist }
  )
end

M.opts = function()
  return {
    telescope = {
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        borderchars = {
          '─',
          '│',
          '─',
          '│',
          '┌',
          '┐',
          '┘',
          '└',
        },
        vimgrep_arguments = {
          'rg',
          '--hidden',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
        },
        file_ignore_patterns = require('utils').concat(
          require('constants').PATTERNS.IMAGE,
          require('constants').PATTERNS.AUDIO,
          require('constants').PATTERNS.VIDEO,
          require('constants').PATTERNS.COMPRESSED,
          { '%.git/' }
        ),
        mappings = {
          n = {
            ['<C-c>'] = require('telescope.actions').close,
            ['q'] = require('telescope.actions').close,
          },
          i = {
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    },
    telescope_extensions = {
      'fzf',
      'ui-select',
    },
  }
end

M.config = function(_, opts)
  require('telescope').setup(opts.telescope)

  for _, extension in ipairs(opts.telescope_extensions) do
    pcall(require('telescope').load_extension, extension)
  end
end

return M
