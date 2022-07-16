local map = require('core.utils').map

map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('i', '<C-n>', '<Esc>:NvimTreeToggle<CR>')
map('n', '<leader>n', ':NvimTreeFocus<CR>')
map('n', '<leader>e', ':NvimTreeFindFile<CR>')
