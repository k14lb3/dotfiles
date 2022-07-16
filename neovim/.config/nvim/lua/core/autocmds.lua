local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

aucmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  command = 'if mode() != "c" | checktime | endif',
})

aucmd('BufWritePost', {
  group = augroup('packer', { clear = true }),
  pattern = 'plugins/init.lua',
  command = 'source <afile> | PackerCompile',
})

aucmd('FileType', {
  pattern = { 'help', 'man', 'lsp-installer', 'qf', 'lspinfo', 'null-ls-info', 'notify' },
  command = 'nnoremap <buffer> <silent> q :q<CR>',
})

aucmd('User', {
  pattern = 'AlphaReady',
  command = 'set showtabline=0 | set laststatus=0',
})

aucmd('BufUnload', {
  buffer = 0,
  command = 'set showtabline=2 | set laststatus=3',
})
