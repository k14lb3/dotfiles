-- ┏━━━━━━━━━━━━━━━━━┓
-- ┃ render-markdown ┃
-- ┗━━━━━━━━━━━━━━━━━┛

local M = {}

M[1] = 'MeanderingProgrammer/render-markdown.nvim'

M.opts = {
  anti_conceal = {
    enabled = false,
  },
  file_types = {
    'markdown',
    'opencode_output',
  },
}

M.ft = {
  'markdown',
  'opencode_output',
}

return M
