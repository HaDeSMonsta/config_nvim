local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file" })
vim.keymap.set("n", "<leader>hr", mark.rm_file, { desc = "Remove file" })
vim.keymap.set("n", "<leader>hc", mark.clear_all, { desc = "Clear all" })
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, { desc = "Toggle quick menu" })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Jump to harpoon marked file 1"})
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "Jump to harpoon marked file 2"})
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Jump to harpoon marked file 3"})
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Jump to harpoon marked file 4"})
