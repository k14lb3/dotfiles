local M = {}

M.on_attach = function(bufnr)
  local buf_map = require('core.utils').buf_map

  buf_map(bufnr, 'n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
  buf_map(bufnr, 'n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
  buf_map(bufnr, 'n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
  buf_map(bufnr, 'v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
  buf_map(bufnr, 'n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
  buf_map(bufnr, 'v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
  buf_map(bufnr, 'n', '<leader>hS', ':Gitsigns stage_buffer<CR>')
  buf_map(bufnr, 'n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>')
  buf_map(bufnr, 'n', '<leader>hR', ':Gitsigns reset_buffer<CR>')
  buf_map(bufnr, 'n', '<leader>hp', ':Gitsigns preview_hunk<CR>')
  buf_map(bufnr, 'n', '<leader>hb', ':lua require"gitsigns".blame_line{full=true}<CR>')
  buf_map(bufnr, 'n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>')
  buf_map(bufnr, 'n', '<leader>hd', ':Gitsigns diffthis<CR>')
  buf_map(bufnr, 'n', '<leader>hD', ':lua require"gitsigns".diffthis("~")<CR>')
  buf_map(bufnr, 'n', '<leader>td', ':Gitsigns toggle_deleted<CR>')
  buf_map(bufnr, 'o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  buf_map(bufnr, 'x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
end

return M
