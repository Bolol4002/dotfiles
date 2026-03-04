-- Lazy.nvim bootstrap + plugins
local lazypath=vim.fn.stdpath("data").."/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git","--branch=stable",lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Colorscheme
  {"catppuccin/nvim",name="catppuccin",priority=1000,config=function()
    require("catppuccin").setup({flavour="mocha",integrations={
      cmp=true,gitsigns=true,neotree=true,telescope=true,
      which_key=true,dashboard=true,treesitter=true,mason=true,
      lsp_trouble=true,harpoon=true,
    }})
    vim.cmd.colorscheme("catppuccin-mocha")
  end},

  -- Core deps
  {"nvim-tree/nvim-web-devicons",lazy=true},
  {"nvim-lua/plenary.nvim",lazy=true},
  {"MunifTanjim/nui.nvim",lazy=true},

  -- Which-key
  {"folke/which-key.nvim",event="VeryLazy",config=function()
    local wk=require("which-key")
    wk.setup({preset="modern",delay=300})
    wk.add({
      {"<leader>b",group="Buffer"},
      {"<leader>d",group="Dired / Explorer"},
      {"<leader>e",group="Eval / Diagnostics"},
      {"<leader>f",group="Find / Files"},
      {"<leader>g",group="Git"},
      {"<leader>h",group="Help"},
      {"<leader>m",group="Marks / Bookmarks"},
      {"<leader>o",group="Org / Notes"},
      {"<leader>p",group="Project"},
      {"<leader>t",group="Toggle"},
      {"<leader>w",group="Window"},
      {"<leader><tab>",group="Tabs"},
    })
  end},

  -- Dashboard
  {"nvimdev/dashboard-nvim",event="VimEnter",
    dependencies={"nvim-tree/nvim-web-devicons"},
    config=function() require("plugins.dashboard") end},

  -- Telescope
  {"nvim-telescope/telescope.nvim",tag="0.1.8",
    dependencies={
      "nvim-lua/plenary.nvim",
      {"nvim-telescope/telescope-fzf-native.nvim",build="make"},
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    config=function() require("plugins.telescope") end},

  -- Neo-tree
  {"nvim-neo-tree/neo-tree.nvim",branch="v3.x",
    dependencies={"nvim-lua/plenary.nvim","nvim-tree/nvim-web-devicons","MunifTanjim/nui.nvim"},
    config=function() require("plugins.neotree") end},

  -- Harpoon v2 (bookmarks + directory marks)
  {"ThePrimeagen/harpoon",branch="harpoon2",
    dependencies={"nvim-lua/plenary.nvim"},
    config=function() require("plugins.harpoon") end},

  -- Treesitter
  {"nvim-treesitter/nvim-treesitter",build=":TSUpdate",config=function()
    require("nvim-treesitter.configs").setup({
      ensure_installed={
        "c","cpp","python","verilog","lua","vim","vimdoc",
        "bash","json","yaml","markdown","markdown_inline",
      },
      highlight={enable=true},indent={enable=true},auto_install=true,
    })
  end},

  -- LSP + Mason
  {"williamboman/mason.nvim",config=function()
    require("mason").setup({ui={border="rounded"}})
  end},
  {"williamboman/mason-lspconfig.nvim",
    dependencies={"williamboman/mason.nvim","neovim/nvim-lspconfig"},
    config=function() require("plugins.lsp") end},
  {"neovim/nvim-lspconfig"},

  -- Autocompletion
  {"hrsh7th/nvim-cmp",event="InsertEnter",
    dependencies={
      "hrsh7th/cmp-nvim-lsp","hrsh7th/cmp-buffer","hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip","saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config=function() require("plugins.cmp") end},

  -- Statusline + bufferline
  {"nvim-lualine/lualine.nvim",dependencies={"nvim-tree/nvim-web-devicons"},config=function()
    require("lualine").setup({
      options={theme="catppuccin",
        component_separators={left="",right=""},
        section_separators={left="",right=""}},
      sections={
        lualine_a={"mode"},lualine_b={"branch","diff","diagnostics"},
        lualine_c={{"filename",path=1}},
        lualine_x={"encoding","fileformat","filetype"},
        lualine_y={"progress"},lualine_z={"location"},
      },
    })
  end},
  {"akinsho/bufferline.nvim",version="*",dependencies="nvim-tree/nvim-web-devicons",
    config=function()
      require("bufferline").setup({options={
        diagnostics="nvim_lsp",
        offsets={{filetype="neo-tree",text="  File Explorer",separator=true}},
        separator_style="slant",
      }})
    end},

  -- ToggleTerm (eshell-like floating terminal)
  {"akinsho/toggleterm.nvim",version="*",config=function()
    require("toggleterm").setup({
      size=function(term)
        if term.direction=="horizontal" then return 20
        elseif term.direction=="vertical" then return math.floor(vim.o.columns*0.40)
        end
      end,
      direction="float",
      float_opts={border="curved"},
      shell=vim.o.shell,
    })
    local Terminal=require("toggleterm.terminal").Terminal
    local eshell=Terminal:new({
      cmd=vim.o.shell,direction="float",
      float_opts={border="curved",title_pos="center",title="  Shell (eshell) "},
      hidden=true,
    })
    _G.toggle_eshell=function() eshell:toggle() end
  end},

  -- Git
  {"lewis6991/gitsigns.nvim",config=function()
    require("gitsigns").setup({signs={
      add={text="▎"},change={text="▎"},delete={text=""},
      topdelete={text=""},changedelete={text="▎"},
    }})
  end},
  {"tpope/vim-fugitive",cmd={"Git","G"}},

  -- Editing helpers
  {"windwp/nvim-autopairs",event="InsertEnter",
    config=function() require("nvim-autopairs").setup() end},
  {"kylechui/nvim-surround",event="VeryLazy",
    config=function() require("nvim-surround").setup() end},
  {"numToStr/Comment.nvim",event="VeryLazy",
    config=function() require("Comment").setup() end},

  -- UI
  {"lukas-reineke/indent-blankline.nvim",main="ibl",event="BufReadPost",
    config=function() require("ibl").setup() end},
  {"folke/todo-comments.nvim",dependencies="nvim-lua/plenary.nvim",event="BufReadPost",
    config=function() require("todo-comments").setup() end},
  {"folke/trouble.nvim",dependencies="nvim-tree/nvim-web-devicons",
    cmd={"TroubleToggle","Trouble"},
    config=function() require("trouble").setup() end},
  {"rcarriga/nvim-notify",config=function()
    require("notify").setup({background_colour="#1e1e2e"})
    vim.notify=require("notify")
  end},
  {"folke/noice.nvim",event="VeryLazy",
    dependencies={"MunifTanjim/nui.nvim","rcarriga/nvim-notify"},
    config=function()
      require("noice").setup({
        lsp={override={
          ["vim.lsp.util.convert_input_to_markdown_lines"]=true,
          ["vim.lsp.util.stylize_markdown"]=true,
          ["cmp.entry.get_documentation"]=true,
        }},
        presets={bottom_search=true,command_palette=true,
          long_message_to_split=true,lsp_doc_border=true},
      })
    end},

  -- Formatter
  {"stevearc/conform.nvim",event="BufWritePre",config=function()
    require("conform").setup({
      formatters_by_ft={c={"clang_format"},cpp={"clang_format"},python={"black"},lua={"stylua"}},
      format_on_save={timeout_ms=500,lsp_fallback=true},
    })
  end},

  -- Session manager
  {"Shatur/neovim-session-manager",dependencies="nvim-lua/plenary.nvim",config=function()
    require("session_manager").setup({
      autoload_mode=require("session_manager.config").AutoloadMode.CurrentDir,
    })
  end},

  -- Org-mode
  {"nvim-orgmode/orgmode",dependencies={"nvim-treesitter/nvim-treesitter"},ft={"org"},
    config=function()
      require("orgmode").setup({
        org_agenda_files={"~/org/**/*"},
        org_default_notes_file="~/org/refile.org",
      })
    end},

},{ui={border="rounded"},checker={enabled=true,notify=false}})
