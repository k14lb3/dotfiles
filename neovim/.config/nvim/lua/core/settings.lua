local M = {}

local g, opt = vim.api.nvim_set_var, vim.api.nvim_set_option

function M.setup()
  M.globals()
  M.options()
end

function M.globals()
  g('mapleader', ',')
end

function M.options()
  opt('backup', false)
  opt('clipboard', 'unnamedplus')
  opt('completeopt', 'menuone,noinsert,noselect')
  opt('cursorline', true)
  opt('expandtab', true)
  opt('fillchars', 'eob: ')
  opt('history', 1000)
  opt('hlsearch', true)
  opt('ignorecase', true)
  opt('laststatus', 3)
  opt('mouse', 'a')
  opt('number', true)
  opt('numberwidth', 3)
  opt('scrolloff', 8)
  opt('shiftwidth', 2)
  opt('showmode', false)
  opt('sidescrolloff', 8)
  opt('signcolumn', 'yes:1')
  opt('smartcase', true)
  opt('smartindent', true)
  opt('smarttab', true)
  opt('swapfile', false)
  opt('splitbelow', true)
  opt('splitright', true)
  opt('tabstop', 2)
  opt('termguicolors', true)
  opt('timeoutlen', 500)
  opt('undofile', true)
  opt('updatetime', 250)
  opt('wrap', false)
end

M.setup()
