-- ┏━━━━━━━━━━┓
-- ┃ settings ┃
-- ┗━━━━━━━━━━┛

local main = function()
  -- ━ Globals ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  require('utils').set_global('mapleader', ',')

  -- ━ Options ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  require('utils').set_options(
    { 'backup', false },
    { 'clipboard', 'unnamedplus' },
    { 'completeopt', 'menuone,noinsert,noselect' },
    { 'cursorline', true },
    { 'expandtab', true },
    { 'fillchars', 'eob: ' },
    { 'history', 1000 },
    { 'hlsearch', true },
    { 'ignorecase', true },
    { 'mouse', 'a' },
    { 'number', true },
    { 'relativenumber', true },
    { 'scrolloff', 8 },
    { 'shiftwidth', 2 },
    { 'showmode', false },
    { 'sidescrolloff', 8 },
    { 'signcolumn', 'yes:1' },
    { 'smartcase', true },
    { 'smartindent', true },
    { 'smarttab', true },
    { 'swapfile', false },
    { 'splitbelow', true },
    { 'splitright', true },
    { 'tabstop', 2 },
    { 'termguicolors', true },
    { 'timeoutlen', 500 },
    { 'undofile', true },
    { 'updatetime', 250 },
    { 'wrap', false }
  )
end

main()
