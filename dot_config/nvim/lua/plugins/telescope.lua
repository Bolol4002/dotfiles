local telescope=require("telescope")
local actions=require("telescope.actions")
telescope.setup({
  defaults={
    prompt_prefix="   ",selection_caret="  ",
    path_display={"smart"},sorting_strategy="ascending",
    layout_config={
      horizontal={prompt_position="top",preview_width=0.55},
      width=0.87,height=0.80,preview_cutoff=120,
    },
    mappings={
      i={["<C-j>"]=actions.move_selection_next,["<C-k>"]=actions.move_selection_previous,
         ["<C-c>"]=actions.close,["<C-x>"]=actions.select_horizontal,
         ["<C-v>"]=actions.select_vertical,["<C-t>"]=actions.select_tab,
         ["<C-u>"]=actions.preview_scrolling_up,["<C-d>"]=actions.preview_scrolling_down},
      n={["<esc>"]=actions.close,["j"]=actions.move_selection_next,
         ["k"]=actions.move_selection_previous,["q"]=actions.close},
    },
  },
  pickers={
    find_files={hidden=true,follow=true,
      find_command={"fd","--type","f","--hidden","--follow",
        "--exclude",".git","--exclude","node_modules"}},
    live_grep={additional_args=function() return{"--hidden"} end},
  },
  extensions={
    fzf={fuzzy=true,override_generic_sorter=true,
      override_file_sorter=true,case_mode="smart_case"},
    file_browser={hijack_netrw=true,hidden=true,respect_gitignore=false},
    project={base_dirs={{"~/",max_depth=4}},hidden_files=true},
  },
})
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("project")
