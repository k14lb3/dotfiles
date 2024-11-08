-- ┏━━━━━━━━━┓
-- ┃ comment ┃
-- ┗━━━━━━━━━┛

local M = {}

M[1] = 'numToStr/Comment.nvim'

M.dependencies = {
  'JoosepAlviste/nvim-ts-context-commentstring',
}

M.event = 'VeryLazy'

M.opts = function()
  return {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
end

return M
