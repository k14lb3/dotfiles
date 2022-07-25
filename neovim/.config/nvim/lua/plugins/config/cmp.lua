local config = function()
  local cmp = require 'cmp'
  local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  local luasnip = require 'luasnip'
  local lspkind = require 'lspkind'
  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = {
        border = 'rounded',
        winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenu,CursorLine:PmenuSel,Search:None',
      },
      documentation = {
        border = 'rounded',
        winhighlight = 'FloatBorder:CmpPmenu',
      },
    },
    formatting = {
      format = lspkind.cmp_format(),
    },
    mapping = cmp.mapping.preset.insert {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm { select = true },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    },
    sources = cmp.config.sources {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'nvim_lua' },
    },
  }

  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

  require('luasnip.loaders.from_vscode').lazy_load()
end

return {
  config = config,
}
