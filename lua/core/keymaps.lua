-- Define opts for all maps
function OPTS(description)
    return { desc = description, silent = true }
end
local function cmd(command)
	return string.format(":%s<CR>", command)
end

-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Security, I guess (?)
vim.keymap.set("n", "Q", "<Nop>")
-- Another type of safety, I guess
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Disable leader key (also safety?)
vim.keymap.set("n", "<leader>", "<Nop>", { silent = true })
-- Disable visual mode after leader
vim.keymap.set("n", "<leader>v", "<Nop>")

-- Open stuff
vim.keymap.set("n", "<leader>oe", vim.cmd.Ex, OPTS("[O]pen [E]xplorer"))
vim.keymap.set("n", "<leader>ot", vim.cmd.term, OPTS("[O]pen [T]erminal"))
vim.keymap.set("n", "<leader>ow", "<C-w>s<C-w>j<C-w>12-", OPTS("[O]pen [W]indow (-12)"))
vim.keymap.set("n", "<leader>ost", "<C-w>s<C-w>j<C-w>12-:term<CR>", OPTS("[O]pen [S]mall [T]erminal"))

-- Open lazy manager
vim.keymap.set("n", "<leader>ol", ":Lazy<Cr>", OPTS("[O]pen [L]azy"))
-- Open mason
vim.keymap.set("n", "<leader>om", ":Mason<Cr>", OPTS("[O]pen [M]ason"))

-- Make double characters
-- vim.keymap.set({ "i", "t" }, "\'", "\'\'<left>")
-- vim.keymap.set({ "i", "t" }, "\"", "\"\"<left>")
-- vim.keymap.set({ "i", "t" }, "`", "``<left>")
-- vim.keymap.set({ "i", "t" }, "(", "()<left>")
-- vim.keymap.set({ "i", "t" }, "{", "{}<left>")
-- vim.keymap.set({ "i", "t" }, "[", "[]<left>")
-- vim.keymap.set({ "i", "t" }, "<", "<><left>")

-- Center display after jump 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move highlighted text with shift 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Easier copy/paste
vim.keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from clipboard (\"+p)" })
vim.keymap.set("n", "<leader>P", "\"+P", { desc = "Paste from clipboard (\"+P)" })
vim.keymap.set("v", "P", "\"+p", { desc = "Paste from clipboard" })
vim.keymap.set("v", "Y", "\"+y", { desc = "Yank to clipboard" })

-- If there is no number before the j/k in wrapped lines it will go up and down in those
-- if we have a count it will jump to the position with the appropriate relative line number 
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Add newlines in normal mode
vim.keymap.set("n", "<CR>", "@='m`o<C-V><Esc>``'<CR>")
-- vim.keymap.set("n", "<S-CR>", "@='m`O<C-V><Esc>``'<CR>") -- Removed because nvim recognized <S-CR> as <CR>

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

-- Exit terminal with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Exit from insert even in autocomplete
-- vim.keymap.set("i", "<Esc>", "<Esc><Esc>")
-- Doesn't work as intendet

-- Start/stop autowrite
vim.keymap.set("n", "<leader>ae", ":AutoWriteEnable<Cr>", { desc = "[A]utowrite [E]nable", silent = true })
vim.keymap.set("n", "<leader>ad", ":AutoWriteDisable<Cr>", { desc = "[A]utowrite [D]isable", silent = true })

-- Git
vim.keymap.set("n", "<leader>ga", ":Git add -A<Cr>", OPTS("[G]it [A]dd -A"))
vim.keymap.set("n", "<leader>gc", ":Git commit -a<Cr>", OPTS("[G]it [C]ommit -a"))
vim.keymap.set("n", "<leader>gps", ":Git push<Cr>", OPTS("[G]it [P]ush"))
vim.keymap.set("n", "<leader>gpl", ":Git pull<Cr>", OPTS("[G]it [P]ull"))
-- vim.keymap.set("n", "<leader>ge", ":Git add -A<Cr>:Git commit -a<CR>:Git push<CR>", { desc = "[G]it [E]verything (add, commit && push)", silent = true })
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, OPTS("[G]it [S]tatus"))
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", OPTS("[G]it [D]iff"))
vim.keymap.set("n", "<leader>gb", cmd("GitBlameToggle"), OPTS("[G]it [B]lame"))

vim.keymap.set("n", "<leader>ra", ":%s/", { desc = "[R]eplace [A]ll" })

-- Set file types
vim.keymap.set("n", "<leader>ff", cmd("setfiletype fish"), OPTS("Set [F]iletype [F]ish"))
vim.keymap.set("n", "<leader>ft", cmd("setfiletype terraform"), OPTS("Set [F]iletype [T]erraform"))

-- Saving file with sudo
-- https://stackoverflow.com/a/7078429/20766205
vim.keymap.set("n", "<leader>ss", cmd("w sudo tee > /dev/null %"), OPTS("[S]afe as [S]udo"))

