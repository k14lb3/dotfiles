local aucmd = vim.api.nvim_create_autocmd

aucmd({ 'VimEnter' }, {
  callback = function(data)
    local nvim_tree_api = require 'nvim-tree.api'
    local IGNORED_FT = { 'gitcommit' }
    local is_no_name = data.file == '' and vim.bo[data.buf].buftype == ''
    local is_directory = vim.fn.isdirectory(data.file) == 1

    if is_no_name then
      return
    end

    if vim.tbl_contains(IGNORED_FT, vim.bo[data.buf].ft) then
      return
    end

    if is_directory then
      vim.cmd.cd(data.file)
    end

    nvim_tree_api.tree.toggle { focus = false }
  end,
})
