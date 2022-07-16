local map = require('core.utils').map

map('n', '<leader>xx', ':Trouble<CR>')
map('n', '<leader>xw', ':Trouble workspace_diagnostics<CR>')
map('n', '<leader>xd', ':Trouble document_diagnostics<CR>')
map('n', '<leader>xl', ':Trouble loclist<CR>')
map('n', '<leader>xq', ':Trouble quickfix<CR>')
map('n', 'gR', ':Trouble lsp_references<CR>')
