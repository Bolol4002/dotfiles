local lspconfig=require("lspconfig")
local mason_lsp=require("mason-lspconfig")
local capabilities=require("cmp_nvim_lsp").default_capabilities()

local on_attach=function(_,bufnr)
  local bmap=function(mode,lhs,rhs,desc)
    vim.keymap.set(mode,lhs,rhs,{buffer=bufnr,silent=true,desc=desc})
  end
  bmap("n","gd",vim.lsp.buf.definition,"LSP: Definition")
  bmap("n","gD",vim.lsp.buf.declaration,"LSP: Declaration")
  bmap("n","gi",vim.lsp.buf.implementation,"LSP: Implementation")
  bmap("n","gr","<cmd>Telescope lsp_references<CR>","LSP: References")
  bmap("n","K",vim.lsp.buf.hover,"LSP: Hover")
  bmap("n","<C-k>",vim.lsp.buf.signature_help,"LSP: Signature")
  bmap("n","<leader>er",vim.lsp.buf.rename,"LSP: Rename")
  bmap("n","<leader>ea",vim.lsp.buf.code_action,"LSP: Code action")
  bmap("n","<leader>ef",function() vim.lsp.buf.format({async=true}) end,"LSP: Format")
  bmap("n","[d",vim.diagnostic.goto_prev,"Prev diagnostic")
  bmap("n","]d",vim.diagnostic.goto_next,"Next diagnostic")
end

vim.diagnostic.config({
  virtual_text={prefix="●"},signs=true,
  update_in_insert=false,severity_sort=true,
  float={border="rounded",source="always"},
})
local signs={Error="",Warn="",Hint="󰠠",Info=""}
for type,icon in pairs(signs) do
  local hl="DiagnosticSign"..type
  vim.fn.sign_define(hl,{text=icon,texthl=hl,numhl=hl})
end

mason_lsp.setup({
  ensure_installed={"clangd","pyright","lua_ls","bashls"},
  automatic_installation=true,
})

local servers={
  clangd={cmd={"clangd","--background-index","--clang-tidy",
    "--header-insertion=iwyu","--completion-style=detailed"}},
  pyright={settings={python={analysis={typeCheckingMode="basic",autoSearchPaths=true}}}},
  lua_ls={settings={Lua={
    diagnostics={globals={"vim"}},
    workspace={library=vim.api.nvim_get_runtime_file("",true),checkThirdParty=false},
    telemetry={enable=false},
  }}},
  bashls={},
}
for server,config in pairs(servers) do
  config.on_attach=on_attach
  config.capabilities=capabilities
  lspconfig[server].setup(config)
end
-- Verilog (install svls via Mason or: cargo install svls)
pcall(function()
  lspconfig.svls.setup({on_attach=on_attach,capabilities=capabilities})
end)
