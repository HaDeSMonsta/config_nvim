-- Make line numbers default
vim.wo.number = true

-- Make line numbers relative
vim.wo.relativenumber = true

-- Make cursor big in insert mode
vim.opt["guicursor"] = ""

-- Don't have less than 8 lines space to the border
vim.opt.scrolloff = 8

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time => Decrease time until nvim switches in "idle" state (not moved cursor)
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Sign column is the thing left of the line numbers, in auto it is only there, if it's used'
vim.wo.signcolumn = "auto"

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
