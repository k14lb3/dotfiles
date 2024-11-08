-- ┏━━━━━━━━━━┓
-- ┃ autocmds ┃
-- ┗━━━━━━━━━━┛

local main = function()
  require('utils').create_autocmds(
    -- https://github.com/prettier/prettier/issues/16234
    {
      { 'BufWritePost' },
      {
        group = require('utils').create_augroup('restart-prettierd'),
        pattern = { '*prettier*' },
        callback = function() vim.fn.system('prettierd restart') end,
      },
    },
    {
      { 'FocusGained', 'TermClose', 'TermLeave' },
      {
        group = require('utils').create_augroup('check-buffer-changes'),
        callback = function()
          if vim.o.buftype ~= 'nofile' then vim.cmd('checktime') end
        end,
      },
    },
    {
      { 'TextYankPost' },
      {
        group = require('utils').create_augroup('highlight-on-yank'),
        callback = function() vim.highlight.on_yank() end,
      },
    },
    {
      { 'FileType' },
      {
        group = require('utils').create_augroup('close-with-q'),
        pattern = { 'help', 'man', 'qf', 'checkhealth', 'startuptime', 'gitsigns-blame' },
        callback = function(event)
          vim.bo[event.buf].buflisted = false
          require('utils').set_keymap('n', 'q', require('utils').close, { buffer = event.buf })
        end,
      },
    }
  )
end

main()
