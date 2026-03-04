local cmp=require("cmp")
local luasnip=require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet={expand=function(args) luasnip.lsp_expand(args.body) end},
  mapping=cmp.mapping.preset.insert({
    ["<C-j>"]=cmp.mapping.select_next_item(),
    ["<C-k>"]=cmp.mapping.select_prev_item(),
    ["<C-b>"]=cmp.mapping.scroll_docs(-4),
    ["<C-f>"]=cmp.mapping.scroll_docs(4),
    ["<C-Space>"]=cmp.mapping.complete(),
    ["<C-e>"]=cmp.mapping.abort(),
    ["<CR>"]=cmp.mapping.confirm({select=true}),
    ["<Tab>"]=cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end,{"i","s"}),
    ["<S-Tab>"]=cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fallback() end
    end,{"i","s"}),
  }),
  sources=cmp.config.sources({
    {name="nvim_lsp",priority=1000},
    {name="luasnip",priority=750},
    {name="buffer",priority=500},
    {name="path",priority=250},
  }),
  window={
    completion=cmp.config.window.bordered(),
    documentation=cmp.config.window.bordered(),
  },
  experimental={ghost_text=true},
})
