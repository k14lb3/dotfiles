local M = {}

M.map = function(mode, lhs, rhs, opts)
  local opts_ = { noremap = true, silent = true }

  if opts == nil then
    opts = {}
  end

  opts = vim.tbl_extend('force', opts_, opts)

  if type(rhs) == 'function' then
    return vim.keymap.set(mode, lhs, rhs, opts)
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

M.buf_map = function(bufnr, mode, lhs, rhs, opts)
  local opts_ = { noremap = true, silent = true }

  if opts == nil then
    opts = {}
  end

  opts = vim.tbl_extend('force', opts_, opts)

  if type(rhs) == 'function' then
    opts = vim.tbl_extend('force', { buffer = bufnr }, opts)
    return vim.keymap.set(mode, lhs, rhs, opts)
  end

  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
end

return M
