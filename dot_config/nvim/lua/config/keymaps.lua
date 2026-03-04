-- Keymaps – SPC leader, Doom Emacs style
local map=function(mode,lhs,rhs,desc,opts)
  opts=vim.tbl_extend("force",{noremap=true,silent=true,desc=desc},opts or{})
  vim.keymap.set(mode,lhs,rhs,opts)
end

-- General
map("n","<Esc>","<cmd>nohlsearch<CR>","Clear search hl")
map("n","<leader>SPC","<cmd>Telescope commands<CR>","Command palette (M-x)")

-- Find/Files
map("n","<leader>.","<cmd>Telescope find_files hidden=true<CR>","Find file (find-file)")
map("n","<leader>ff","<cmd>Telescope find_files hidden=true<CR>","Find file")
map("n","<leader>fr","<cmd>Telescope oldfiles<CR>","Recent files")
map("n","<leader>fg","<cmd>Telescope live_grep<CR>","Live grep")
map("n","<leader>fb","<cmd>Telescope buffers<CR>","Find buffer")
map("n","<leader>fc",function()
  require("telescope.builtin").find_files({cwd=vim.fn.stdpath("config"),hidden=true})
end,"Find in nvim config")
map("n","<leader>ft","<cmd>Neotree position=left dir=./ toggle<CR>","Project tree")
map("n","<leader>fe","<cmd>Telescope file_browser<CR>","File browser")

-- Buffers
map("n","<leader>bb","<cmd>Telescope buffers<CR>","Switch buffer")
map("n","<leader>bk","<cmd>bd<CR>","Kill buffer")
map("n","<leader>bn","<cmd>bnext<CR>","Next buffer")
map("n","<leader>bp","<cmd>bprevious<CR>","Prev buffer")
map("n","<leader>br","<cmd>e!<CR>","Reload buffer")
map("n","<Tab>","<cmd>bnext<CR>","Next buffer")
map("n","<S-Tab>","<cmd>bprevious<CR>","Prev buffer")

-- Windows
map("n","<leader>wc","<C-w>q","Close window")
map("n","<leader>wn","<C-w>n","New window")
map("n","<leader>ws","<cmd>split<CR>","Horizontal split")
map("n","<leader>wv","<cmd>vsplit<CR>","Vertical split")
map("n","<leader>wh","<C-w>h","Window left")
map("n","<leader>wj","<C-w>j","Window down")
map("n","<leader>wk","<C-w>k","Window up")
map("n","<leader>wl","<C-w>l","Window right")
map("n","<leader>ww","<C-w>w","Next window")
map("n","<leader>w=","<C-w>=","Balance windows")
map("n","<C-Up>","<cmd>resize +2<CR>","Grow height")
map("n","<C-Down>","<cmd>resize -2<CR>","Shrink height")
map("n","<C-Left>","<cmd>vertical resize -2<CR>","Shrink width")
map("n","<C-Right>","<cmd>vertical resize +2<CR>","Grow width")

-- Toggle
map("n","<leader>te","<cmd>lua _G.toggle_eshell()<CR>","Toggle eshell (float)")
map("n","<leader>tv","<cmd>ToggleTerm direction=vertical<CR>","Toggle terminal (vsplit)")
map("n","<leader>th","<cmd>ToggleTerm direction=horizontal<CR>","Toggle terminal (hsplit)")
map("n","<leader>tl","<cmd>set nu! rnu!<CR>","Toggle line numbers")
map("n","<leader>tt","<cmd>Neotree toggle<CR>","Toggle NeoTree (tree nav)")

-- Dired/Explorer
map("n","<leader>dd","<cmd>Neotree reveal<CR>","Open file explorer")
map("n","<leader>dj","<cmd>Neotree reveal_file=%:p<CR>","Reveal current file")
map("n","<leader>dn","<cmd>Neotree toggle<CR>","Toggle NeoTree")
map("n","<leader>db","<cmd>Telescope file_browser<CR>","Browse files")

-- Marks/Bookmarks (Harpoon)
map("n","<leader>ma",function() require("harpoon"):list():add() end,"Add bookmark")
map("n","<leader>mm",function()
  local h=require("harpoon")
  h.ui:toggle_quick_menu(h:list())
end,"Bookmark menu")
map("n","<leader>m1",function() require("harpoon"):list():select(1) end,"Bookmark 1")
map("n","<leader>m2",function() require("harpoon"):list():select(2) end,"Bookmark 2")
map("n","<leader>m3",function() require("harpoon"):list():select(3) end,"Bookmark 3")
map("n","<leader>m4",function() require("harpoon"):list():select(4) end,"Bookmark 4")
map("n","<leader>mp",function() require("harpoon"):list():prev() end,"Prev bookmark")
map("n","<leader>mn",function() require("harpoon"):list():next() end,"Next bookmark")
map("n","<leader>md","<cmd>lua require('plugins.harpoon').add_dir()<CR>","Add dir bookmark")

-- Git
map("n","<leader>gs","<cmd>Git<CR>","Git status")
map("n","<leader>gb","<cmd>Telescope git_branches<CR>","Git branches")
map("n","<leader>gc","<cmd>Telescope git_commits<CR>","Git commits")
map("n","<leader>gd","<cmd>Gitsigns diffthis<CR>","Git diff")
map("n","<leader>gp","<cmd>Gitsigns preview_hunk<CR>","Preview hunk")
map("n","<leader>gr","<cmd>Gitsigns reset_hunk<CR>","Reset hunk")
map("n","<leader>gS","<cmd>Gitsigns stage_hunk<CR>","Stage hunk")

-- LSP/Diagnostics
map("n","<leader>ed","<cmd>Trouble diagnostics toggle<CR>","Diagnostics list")
map("n","<leader>ef",function() vim.lsp.buf.format({async=true}) end,"Format buffer")
map("n","<leader>er",vim.lsp.buf.rename,"Rename symbol")
map("n","<leader>ea",vim.lsp.buf.code_action,"Code actions")
map("n","<leader>ei",vim.lsp.buf.hover,"Hover info")
map("n","gd",vim.lsp.buf.definition,"Go to definition")
map("n","gi",vim.lsp.buf.implementation,"Implementation")
map("n","gr","<cmd>Telescope lsp_references<CR>","References")
map("n","K",vim.lsp.buf.hover,"Hover docs")
map("n","[d",vim.diagnostic.goto_prev,"Prev diagnostic")
map("n","]d",vim.diagnostic.goto_next,"Next diagnostic")

-- Help
map("n","<leader>hd","<cmd>Dashboard<CR>","Dashboard")
map("n","<leader>hf","<cmd>Telescope help_tags<CR>","Help tags")
map("n","<leader>hm","<cmd>Mason<CR>","Mason")
map("n","<leader>hl","<cmd>Lazy<CR>","Lazy")
map("n","<leader>hc","<cmd>checkhealth<CR>","Health check")

-- Org
map("n","<leader>oa",function()
  require("orgmode").action("agenda.prompt")
end,"Org agenda")
map("n","<leader>oc",function()
  require("orgmode").action("capture.prompt")
end,"Org capture")

-- Project
map("n","<leader>pp","<cmd>Telescope project<CR>","Switch project")
map("n","<leader>pf","<cmd>Telescope find_files<CR>","Find file in project")
map("n","<leader>pg","<cmd>Telescope live_grep<CR>","Grep in project")

-- Comment
map("n","<leader><tab><tab>",function()
  require("Comment.api").toggle.linewise.current()
end,"Comment line")
map("v","<leader><tab><tab>",function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>",true,false,true),"nx",false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end,"Comment region")

-- Tabs
map("n","<leader><tab>n","<cmd>tabnew<CR>","New tab")
map("n","<leader><tab>c","<cmd>tabclose<CR>","Close tab")
map("n","<leader><tab>]","<cmd>tabnext<CR>","Next tab")
map("n","<leader><tab>[","<cmd>tabprev<CR>","Prev tab")

-- Clipboard helpers (on top of unnamedplus)
map({"n","v"},"<leader>y",'"+y',"Yank → system clipboard")
map("n","<leader>Y",'"+Y',"Yank line → system clipboard")
map("n","<leader>P",'"+p',"Paste ← system clipboard")
map("v","p",'"_dP',"Paste (keep register)")

-- Better scrolling
map("n","<C-d>","<C-d>zz","Scroll down centred")
map("n","<C-u>","<C-u>zz","Scroll up centred")
map("n","n","nzzzv","Next result centred")
map("n","N","Nzzzv","Prev result centred")

-- Terminal
map("t","<Esc><Esc>","<C-\\><C-n>","Exit terminal mode")
map("t","<C-h>","<C-\\><C-n><C-w>h","Term→left")
map("t","<C-j>","<C-\\><C-n><C-w>j","Term→down")
map("t","<C-k>","<C-\\><C-n><C-w>k","Term→up")
map("t","<C-l>","<C-\\><C-n><C-w>l","Term→right")
