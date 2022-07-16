local config = function()
  local treesitter = require 'nvim-treesitter.configs'

  treesitter.setup {
    ensure_installed = {
      'bash',
      'c',
      'comment',
      'css',
      'cpp',
      'lua',
      'python',
      'javascript',
      'tsx',
      'typescript',
      'html',
      'scss',
      'json',
      'jsdoc',
      'jsonc',
      'regex',
      'query',
      'vim',
      'yaml',
    },
    sync_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    autotag = {
      enable = true,
    },
  }
end

return {
  run = ':TSUpdate',
  config = config,
}
