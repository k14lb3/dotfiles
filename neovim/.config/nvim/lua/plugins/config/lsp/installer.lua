local lsp_installer = require 'nvim-lsp-installer'
local servers = require 'plugins.config.lsp.servers'

lsp_installer.setup {
  ensure_installed = servers,
  automatic_installation = true,
  ui = {
    check_outdated_servers_on_open = true,
    border = 'none',
    icons = {
      server_installed = '◍',
      server_pending = '◍',
      server_uninstalled = '◍',
    },
    keymaps = {
      toggle_server_expand = '<CR>',
      install_server = 'i',
      update_server = 'u',
      check_server_version = 'c',
      update_all_servers = 'U',
      check_outdated_servers = 'C',
      uninstall_server = 'X',
    },
  },
  pip = {
    install_args = {},
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
  github = {
    download_url_template = 'https://github.com/%s/releases/download/%s/%s',
  },
}
