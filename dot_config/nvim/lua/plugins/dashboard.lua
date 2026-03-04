require("dashboard").setup({
  theme="doom",
  config={
    header={
      "",
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "","           The best editor is one you love           ","",
    },
    center={
      {icon="  ",desc="Find File              ",key="f",
        action="Telescope find_files hidden=true"},
      {icon="  ",desc="Recent Files           ",key="r",
        action="Telescope oldfiles"},
      {icon="  ",desc="Projects               ",key="p",
        action="Telescope project"},
      {icon="  ",desc="Bookmarks (Harpoon)    ",key="b",
        action=function()
          local h=require("harpoon")
          h.ui:toggle_quick_menu(h:list())
        end},
      {icon="  ",desc="Org Agenda             ",key="a",
        action=function() vim.cmd("e ~/org/agenda.org") end},
      {icon="  ",desc="Edit Neovim Config     ",key="c",
        action=function()
          require("telescope.builtin").find_files({
            cwd=vim.fn.stdpath("config"),hidden=true})
        end},
      {icon="  ",desc="Grep / Search          ",key="g",
        action="Telescope live_grep"},
      {icon="󰒲  ",desc="Lazy (plugins)         ",key="l",action="Lazy"},
      {icon="  ",desc="Quit                   ",key="q",action="qa"},
    },
    footer=function()
      local s=require("lazy").stats()
      return {"","⚡ Neovim loaded "..s.loaded.."/"..s.count.." plugins"}
    end,
  },
})
