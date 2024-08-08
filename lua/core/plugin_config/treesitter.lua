require"nvim-treesitter.configs".setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", -- the five mentioned above
	"javascript", "typescript", -- ThePrimeagen tutorial
	"haskell", "java", "gitignore", "json", "python", "rust", -- picked by me 
	"cpp", "go", "tsx", "bash" }, -- from kickstart nvim 

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- if those lines are removed, the LSP complains
	ignore_install = {},
	modules = {},

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	highlight = {
		enable = true,
		disable = { "just" }, -- use vim-just
		additional_vim_regex_highlighting = false,
	},
	-- indent = { enable = true }, -- don't, it's annoying and inconsistent
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			scope_incremental = "<c-s>",
			node_incremental = "<c-space>",
			node_decremental = "<M-space>"
		},
	},
	select = {
		enable = true,
		lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
		keymaps = {
			-- You can use the capture groups defined in textobjects.scm
			["aa"] = "@parameter.outer",
			["ia"] = "@parameter.inner",
			["af"] = "@function.outer",
			["if"] = "@function.inner",
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
		},
	},
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]m"] = "@function.outer",
			["]]"] = "@class.outer",
		},
		goto_next_end = {
			["]M"] = "@function.outer",
			["]["] = "@class.outer",
		},
		goto_previous_start = {
			["[m"] = "@function.outer",
			["[["] = "@class.outer",
		},
		goto_previous_end = {
			["[M"] = "@function.outer",
			["[]"] = "@class.outer",
		},
	},
	swap = {
		enable = true,
		swap_next = {
			["<leader>a"] = "@parameter.inner",
		},
		swap_previous = {
			["<leader>A"] = "@parameter.inner",
		},
	},
}

