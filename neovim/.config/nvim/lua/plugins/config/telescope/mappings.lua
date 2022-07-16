local map = require('core.utils').map

map('n', '<leader>tc', ':Telescope commands<CR>')
map('n', '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fo', ':Telescope oldfiles<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>fp', ':Telescope project<CR>')
map('n', '<leader>fm', ':Telescope man_pages<CR>')
map('n', '<leader>fn', ':Telescope notify<CR>')
