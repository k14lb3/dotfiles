-- ┏━━━━━━━━━┓
-- ┃ keymaps ┃
-- ┗━━━━━━━━━┛

local main = function()
  -- ━ General ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  require('utils').set_keymaps(
    { 'n', '<Leader>q', require('utils').close },
    { 'n', '<Leader>Q', require('utils').close_all },
    { { 'i', 'x', 'n', 's' }, '<C-s>', '<Cmd>w<CR>' }
  )

  -- ━ Search ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  require('utils').set_keymaps(
    { 'n', '<C-[>', '<Cmd>nohl<CR>' },
    { { 'n', 'x', 'o' }, 'n', '"Nn"[v:searchforward]', { expr = true } },
    { { 'n', 'x', 'o' }, 'N', '"nN"[v:searchforward]', { expr = true } }
  )

  -- ━ Window ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- stylua: ignore
  require('utils').set_keymaps(
    {'n', '<Leader>-', '<Cmd>split<CR>'},
    {'n', '<Leader>\\', '<Cmd>vsplit<CR>'}
  )

  -- ━ Pane ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- Navigation
  require('utils').set_keymaps(
    { 'n', '<C-h>', '<C-W>h' },
    { 'n', '<C-j>', '<C-W>j' },
    { 'n', '<C-k>', '<C-W>k' },
    { 'n', '<C-l>', '<C-W>l' },
    { 'i', '<C-h>', '<Esc><C-W>h' },
    { 'i', '<C-j>', '<Esc><C-W>j' },
    { 'i', '<C-k>', '<Esc><C-W>k' },
    { 'i', '<C-l>', '<Esc><C-W>l' }
  )

  -- Swap
  require('utils').set_keymaps(
    { 'n', '<C-A-h>', '<Cmd>wincmd H<CR>' },
    { 'n', '<C-A-j>', '<Cmd>wincmd J<CR>' },
    { 'n', '<C-A-k>', '<Cmd>wincmd K<CR>' },
    { 'n', '<C-A-l>', '<Cmd>wincmd L<CR>' }
  )

  -- ━ Text ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  require('utils').set_keymaps(
    { 'n', '<A-j>', '<Cmd>m .+1<CR>==' },
    { 'n', '<A-k>', '<Cmd>m .-2<CR>==' },
    { 'i', '<A-j>', '<Esc><Cmd>m .+1<CR>==gi' },
    { 'i', '<A-k>', '<Esc><Cmd>m .-2<CR>==gi' },
    { 'x', '<A-j>', ":m '>+1<CR>gv=gv" },
    { 'x', '<A-k>', ":m '<-2<CR>gv=gv" }
  )

  -- ━ Indentation ━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- stylua: ignore
  require('utils').set_keymaps(
    { 'v', '<', '<gv' },
    { 'v', '>', '>gv' }
  )

  -- ━ Yank ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  -- stylua: ignore
  require('utils').set_keymaps(
    {
      'n',
      '<Leader>y',
      function()
        vim.cmd('let @+ = expand("%:t")')
        vim.notify('Filename copied to clipboard.')
      end,
    },
    {
      'n',
      '<Leader>Y',
      function()
        vim.cmd('let @+ = expand("%")')
        vim.notify('Filepath copied to clipboard.')
      end,
    }
  )
end

main()
