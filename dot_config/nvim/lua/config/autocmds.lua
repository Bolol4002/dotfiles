local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("YankFlash",{clear=true})
autocmd("TextYankPost",{group="YankFlash",callback=function()
  vim.highlight.on_yank({higroup="Visual",timeout=150})
end})

augroup("RestoreCursor",{clear=true})
autocmd("BufReadPost",{group="RestoreCursor",callback=function()
  local mark=vim.api.nvim_buf_get_mark(0,'"')
  if mark[1]>0 and mark[1]<=vim.api.nvim_buf_line_count(0) then
    pcall(vim.api.nvim_win_set_cursor,0,mark)
  end
end})

augroup("CloseWithQ",{clear=true})
autocmd("FileType",{group="CloseWithQ",
  pattern={"help","qf","man","notify","startuptime","lspinfo","checkhealth"},
  callback=function(ev)
    vim.bo[ev.buf].buflisted=false
    vim.keymap.set("n","q","<cmd>close<CR>",{buffer=ev.buf,silent=true})
  end})

augroup("VerilogFT",{clear=true})
autocmd({"BufRead","BufNewFile"},{group="VerilogFT",
  pattern={"*.v","*.sv","*.vh","*.svh"},command="set filetype=verilog"})

autocmd("BufWritePre",{group=augroup("TrimWS",{clear=true}),
  pattern={"*.c","*.cpp","*.h","*.hpp","*.py","*.lua","*.v","*.sv"},
  callback=function()
    local pos=vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0,pos)
  end})

autocmd("BufWritePre",{group=augroup("AutoMkdir",{clear=true}),
  callback=function(ev)
    local dir=vim.fn.fnamemodify(ev.file,":p:h")
    if vim.fn.isdirectory(dir)==0 then vim.fn.mkdir(dir,"p") end
  end})

autocmd("VimResized",{group=augroup("AutoResize",{clear=true}),
  callback=function() vim.cmd("wincmd =") end})
