-- ┏━━━━━━━━┓
-- ┃ config ┃
-- ┗━━━━━━━━┛

local M = {}

M[1] = 'hrsh7th/nvim-cmp'

M.dependencies = {
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'FelipeLema/cmp-async-path',
  'SergioRibera/cmp-dotenv',
  'hrsh7th/cmp-calc',
  'rafamadriz/friendly-snippets',
}

M.event = 'VeryLazy'

M.init = function()
  require('utils').set_highlight_groups(
    { 0, 'CmpGhostText', { fg = require('lackluster.color-special').comment } },
    { 0, 'CmpCmdlineFloatBorder', { fg = require('lackluster.color').gray4 } },
    { 0, 'CmpCmdlineCursorLine', { fg = require('lackluster.color').luster, bg = require('lackluster.color').gray3 } }
  )
end

M.opts = function()
  return {
    cmd = {
      enabled = function()
        if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then return false end

        if require('utils').is_recording_macro() then return false end

        if require('utils').is_executing_macro() then return false end

        if require('cmp.config.context').in_treesitter_capture('comment') then return false end

        return true
      end,
      window = {
        completion = require('cmp').config.window.bordered({ border = 'single' }),
        documentation = require('cmp').config.window.bordered({ border = 'single' }),
      },
      snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
      },
      formatting = {
        format = function(_, item)
          item.kind = string.format(
            '%s %s',
            ({
              Text = require('constants').ICONS.KEY,
              Method = require('constants').ICONS.METHOD,
              Function = require('constants').ICONS.METHOD,
              Constructor = require('constants').ICONS.METHOD,
              Field = require('constants').ICONS.FIELD,
              Variable = require('constants').ICONS.VARIABLE,
              Class = require('constants').ICONS.CLASS,
              Interface = require('constants').ICONS.INTERFACE,
              Module = require('constants').ICONS.NAMESPACE,
              Property = require('constants').ICONS.PROPERTY,
              Unit = require('constants').ICONS.RULER,
              Value = require('constants').ICONS.ENUM,
              Enum = require('constants').ICONS.ENUM,
              Keyword = require('constants').ICONS.KEYWORD,
              Snippet = require('constants').ICONS.SNIPPET,
              Color = require('constants').ICONS.COLOR,
              File = require('constants').ICONS.FILE,
              Reference = require('constants').ICONS.GO_TO_FILE,
              Folder = require('constants').ICONS.FOLDER,
              EnumMember = require('constants').ICONS.ENUM,
              Constant = require('constants').ICONS.CONSTANT,
              Struct = require('constants').ICONS.EVENT,
              Event = require('constants').ICONS.EVENT,
              Operator = require('constants').ICONS.OPERATOR,
              TypeParameter = require('constants').ICONS.FONT,
            })[item.kind],
            item.kind
          )

          return item
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noselect,noinsert',
      },
      mapping = {
        ['<C-Space>'] = require('cmp').mapping(function(fallback)
          if require('cmp').visible() then
            require('cmp').abort()
            return
          end

          if not require('cmp').visible() then
            require('cmp').complete()
            return
          end

          fallback()
        end),
        ['<CR>'] = require('cmp').mapping(function(fallback)
          if require('cmp').visible() and require('luasnip').expandable() then
            require('luasnip').expand()
            return
          end

          if require('cmp').visible() and not require('luasnip').expandable() then
            require('cmp').confirm({ select = true })
            return
          end

          fallback()
        end),
        ['<S-Tab>'] = require('cmp').mapping(function(fallback)
          if require('cmp').visible() then
            require('cmp').select_prev_item({ behavior = require('cmp.types').cmp.SelectBehavior.Select })
            return
          end

          if require('luasnip').locally_jumpable(-1) then
            require('luasnip').jump(-1)
            return
          end

          fallback()
        end, { 'i', 's' }),
        ['<Tab>'] = require('cmp').mapping(function(fallback)
          if require('cmp').visible() then
            require('cmp').select_next_item({ behavior = require('cmp.types').cmp.SelectBehavior.Select })
            return
          end

          if require('luasnip').locally_jumpable(1) then
            require('luasnip').jump(1)
            return
          end

          fallback()
        end, { 'i', 's' }),
        ['<C-u>'] = require('cmp').mapping.scroll_docs(-4),
        ['<C-d>'] = require('cmp').mapping.scroll_docs(4),
      },
      sources = require('cmp').config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'async_path' },
        { name = 'dotenv' },
        { name = 'calc' },
      }, {
        { name = 'buffer' },
      }),
      experimental = {
        ghost_text = {
          hl_group = 'CmpGhostText',
        },
      },
    },
    cmdline = {
      window = {
        completion = require('cmp').config.window.bordered({
          border = 'single',
          winhighlight = string.format(
            '%s,%s,%s,%s',
            'Normal:Normal',
            'FloatBorder:CmpCmdlineFloatBorder',
            'CursorLine:CmpCmdlineCursorLine',
            'Search:None'
          ),
          scrollbar = false,
        }),
      },
      formatting = {
        format = function(_, item)
          item.kind = ''
          return item
        end,
      },
      mapping = require('cmp').mapping.preset.cmdline(),
      sources = require('cmp').config.sources({
        { name = 'async_path' },
      }, {
        { name = 'cmdline' },
      }),
      matching = {
        disallow_symbol_nonprefix_matching = false,
      },
    },
    filetype = {
      {
        'oil',
        'harpoon',
      },
      {
        enabled = false,
      },
    },
  }
end

M.config = function(_, opts)
  require('cmp').setup(opts.cmd)
  require('cmp').setup.cmdline(':', opts.cmdline)
  require('cmp').setup.filetype(require('utils').unpack(opts.filetype))
end

return M
