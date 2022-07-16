local map = require('core.utils').map

local M = {}

function M.general()
  -- Quit all
  map('n', '<leader>Q', ':qa<CR>')

  -- Close Buffer
  map('n', '<leader>q', ':Bdelete<CR>')

  -- Save File
  map('n', '<C-s>', ':w<CR>')

  -- Window Split
  map('n', '<leader>v', ':vsplit<CR>')
  map('n', '<leader>x', ':split<CR>')

  -- Better Pane Navigation
  map('n', '<C-h>', '<C-w>h')
  map('n', '<C-j>', '<C-w>j')
  map('n', '<C-k>', '<C-w>k')
  map('n', '<C-l>', '<C-w>l')
  map('i', '<C-h>', '<Esc><C-w>h')
  map('i', '<C-j>', '<Esc><C-w>j')
  map('i', '<C-k>', '<Esc><C-w>k')
  map('i', '<C-l>', '<Esc><C-w>l')

  -- Pane Resize
  map('n', '<C-S-Right>', ':vertical resize +2<CR>')
  map('n', '<C-S-Down>', ':resize +2<CR>')
  map('n', '<C-S-Up>', ':resize -2<CR>')
  map('n', '<C-S-Left>', ':vertical resize -2<CR>')

  -- Text Movement Up and Down
  map('n', '<A-j>', ':m .+1<CR>')
  map('n', '<A-k>', ':m .-2<CR>')
  map('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
  map('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
  map('x', '<A-j>', ":m '>+1<CR>gv-gv")
  map('x', '<A-k>', ":m '<-2<CR>gv-gv")

  -- Better Visual Indentation
  map('v', '<', '<gv')
  map('v', '>', '>gv')

  -- Search Highlight Remove
  map('n', '<Esc><Esc>', ':nohl<CR>')
end

function M.setup()
  M.general()
end

M.setup()
