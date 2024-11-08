-- ┏━━━━━━━━━━━━━┓
-- ┃ textobjects ┃
-- ┗━━━━━━━━━━━━━┛

local M = {}

M[1] = 'nvim-treesitter/nvim-treesitter-textobjects'

M.dependencies = {
  'nvim-treesitter/nvim-treesitter',
}

M.main = 'nvim-treesitter.configs'

M.event = 'VeryLazy'

M.opts = function()
  return {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['aB'] = '@block.outer',
          ['iB'] = '@block.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          [']C'] = '@class.outer',
        },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<Leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<Leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end

return M
