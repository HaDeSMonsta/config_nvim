-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open stuff
vim.keymap.set("n", "<leader>oe", vim.cmd.Ex, { desc = "[O]pen [E]xplorer" })
vim.keymap.set("n", "<leader>ot", vim.cmd.term, { desc = "[O]pen [T]erminal" })

-- Make double quotes and braces
vim.keymap.set("i", "\'", "\'\'<left>")
vim.keymap.set("i", "\"", "\"\"<left>")
vim.keymap.set("i", "`", "``<left>")
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "[", "[]<left>")

-- Center display after jump 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move highlighted text with shift 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Easier copy/paste
vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from clipboard (\"+p)" })
vim.keymap.set("n", "<leader>P", "\"+P", { desc = "Paste from clipboard (\"+P)" })
vim.keymap.set("v", "P", "\"+p", { desc = "Pastw from clipboard" })
vim.keymap.set("v", "Y", "\"+y", { desc = "Yank to clipboard" })

-- Security, I guess (?)
vim.keymap.set("n", "Q", "<Nop>")
-- Another type of safety, I guess
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Disable leader key (also safety?)
vim.keymap.set({ "n" }, "<leader>", "<Nop>", { silent = true })

-- If there is no number before the j/k in wrapped lines it will go up and down in those
-- if we have a count it will jump to the position with the appropriate relative line number 
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
-- Either the last two don't work, or I don't know how (which is probably the reason)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- W Keybinds
vim.keymap.set("n", "<leader>wv", "<C-w>v<C-w>l",{ desc = "Split vertically" })
vim.keymap.set("n", "<leader>ws", "<C-w>s<C-w>j",{ desc = "Split window" })
vim.keymap.set("n", "<leader>wo", "<C-w>o",{ desc = "Close all [O]ther windows" })
-- Move in windows
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Switch to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Switch to lower window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Switch to upper window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Switch to right window" })

-- Exit termonal with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Exit from insert even in autocomplete
-- vim.keymap.set("i", "<Esc>", "<Esc><Esc>")
-- Doesn't work as intendet
