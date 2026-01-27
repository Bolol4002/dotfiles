-- leader
vim.g.mapleader = " "

-- lazy.nvim bootstrap
local p=vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(p) then
  vim.fn.system({"git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git",p})
end
vim.opt.rtp:prepend(p)

require("lazy").setup({
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-telescope/telescope.nvim", dependencies={"nvim-lua/plenary.nvim"} },
})

-- nvim-tree
require("nvim-tree").setup({
  filters={ dotfiles=false },
  view={ width=30 },
})

vim.keymap.set("n","<leader>e",":NvimTreeToggle<CR>")

-- telescope
require("telescope").setup({
  defaults={ hidden=true },
})
vim.keymap.set("n","<leader>ff",
  ":Telescope find_files hidden=true no_ignore=true search_dirs={'.','~/.config'}<CR>"
)

-- file handlers
vim.api.nvim_create_autocmd("BufEnter",{
  pattern="*.pdf",
  callback=function()
    vim.fn.jobstart({"zathura",vim.fn.expand("%")},{detach=true})
    vim.cmd("bd!")
  end
})

vim.api.nvim_create_autocmd("BufEnter",{
  pattern={"*.png","*.jpg","*.jpeg","*.webp"},
  callback=function()
    vim.cmd("term chafa "..vim.fn.expand("%"))
  end
})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("enew")
      vim.bo.buftype = "nofile"
      vim.bo.bufhidden = "wipe"
      vim.bo.swapfile = false
      vim.bo.modifiable = true

      local banner = {
"╔══════════════════════════════════════════════════════════════╗",
"║ ╔══════════════════════════════════════════════════════════╗ ║",
"║ ║                                                          ║ ║",
"║ ║   ███████╗ █████╗ ██╗   ██╗ ██████╗  ██████╗      ██╗    ║ ║",
"║ ║   ██╔════╝██╔══██╗╚██╗ ██╔╝██╔═══██╗██╔═══██╗     ██║    ║ ║",
"║ ║   ███████╗███████║ ╚████╔╝ ██║   ██║██║   ██║     ██║    ║ ║",
"║ ║   ╚════██║██╔══██║  ╚██╔╝  ██║   ██║██║   ██║██   ██║    ║ ║",
"║ ║   ███████║██║  ██║   ██║   ╚██████╔╝╚██████╔╝╚█████╔╝    ║ ║",
"║ ║   ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚═════╝  ╚════╝     ║ ║",
"║ ║                                                          ║ ║",
"║ ╚══════════════════════════════════════════════════════════╝ ║",
"╚══════════════════════════════════════════════════════════════╝",
      }

      vim.api.nvim_buf_set_lines(0, 0, -1, false, banner)
      vim.bo.modifiable = false
      vim.cmd("normal! gg")
    end
  end,
})



