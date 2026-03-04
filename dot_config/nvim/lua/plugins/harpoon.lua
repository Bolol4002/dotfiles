local harpoon=require("harpoon")
harpoon:setup({settings={save_on_toggle=true,sync_on_ui_close=true}})

local M={}
M.add_dir=function()
  local ok=pcall(require,"telescope")
  if not ok then vim.notify("telescope not available",vim.log.levels.ERROR) return end
  require("telescope").extensions.file_browser.file_browser({
    prompt_title="Bookmark a Directory",select_buffer=false,
    attach_mappings=function(prompt_bufnr,map_fn)
      local actions=require("telescope.actions")
      local state=require("telescope.actions.state")
      map_fn("i","<CR>",function()
        local entry=state.get_selected_entry()
        actions.close(prompt_bufnr)
        if entry then
          local path=entry.path or entry.value
          harpoon:list():add({value=path,context={row=1,col=0}})
          vim.notify("Bookmarked: "..path,vim.log.levels.INFO)
        end
      end)
      return true
    end,
  })
end
return M
