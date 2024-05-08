local function my_on_attach_hm(bufnr)
  local api = require "nvim-tree.api"

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<cr>", OPTS("[T]ree [T]oggle"))
  vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<cr>", OPTS("[T]ree [F]ocus"))
  vim.keymap.set("n", "<leader>tca", ":NvimTreeCollapse<cr>", OPTS("[T]ree [C]ollapse [A]ll"))
  vim.keymap.set("n", "<leader>tck", ":NvimTreeCollapseKeepBuffers<cr>", OPTS("[T]ree [C]ollapse [K]eep current buffer")) -- Doesn't realy work, maybe remove'
  vim.keymap.set("n", "<leader>tr", "<C-]>", OPTS("[T]ree change [R]oot")) -- CTRL + ] works, bit keymap not
  vim.keymap.set("n", "<leader>ti", api.tree.toggle_gitignore_filter, OPTS("[T]ree tiggle git[I]gnored files"))
end

require("nvim-tree").setup {
    on_attach = my_on_attach_hm,
}

require("nvim-web-devicons").setup({
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };

 -- Show gitignored files
 -- Which does not work
 filters = {
     git_ignored = false,
 };
})
