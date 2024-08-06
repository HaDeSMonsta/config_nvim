-- Make line numbers default
vim.wo.number = true

-- Make line numbers relative
vim.wo.relativenumber = true

-- Make cursor big in insert mode
-- vim.opt["guicursor"] = ""

-- Don't have less than 8 lines space to the border
vim.opt.scrolloff = 8

-- Define indentation
vim.opt.tabstop = 4        -- Number of spaces a tab counts for
vim.opt.softtabstop = 4    -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = false  -- Use tabs instead of spaces

-- Make nvim automatically indent when appropriate
vim.opt.smartindent = true

-- Longer lines will be wrapped, is default I think, but better safe than sorry
vim.opt.wrap = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Better search experience
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Decrease update time => Decrease time until nvim switches in "idle" state (not moved cursor)
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Good thing in theory, but the colour is full red
-- vim.opt.colorcolumn = "80"

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
