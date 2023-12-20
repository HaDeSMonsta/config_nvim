local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Theme
    {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
  },

  -- Comment out lines, I guess
  {
	  "numToStr/Comment.nvim",
	  opts = {}
  },

  -- Git related plugins => make the life in nvim easier
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Git symbols
 {
    "lewis6991/gitsigns.nvim",
    opts = {
	    -- :help gitsigns.txt
	    signs = {
		    add = { text = "+" },
		    delete = { text = "-" },
		    change = { text = "~" },
		    topdelete = { text = "‾" },
		    changedelete = { text = "~" },
	    },
	    on_attach = function(bufnr)
		    vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk, { buffer = bufnr, desc = "Preview git hunk" })

		    -- Don't override build in and fugitive keymaps
		    local gs = package.loaded.gitsigns
		    vim.keymap.set({ "n", "v" }, "]c", function()
			    if vim.wo.diff then
				    return "]c"
			    end
			    vim.schedule(function()
				    gs.next_hunk()
			    end)
			    return "<Ignore>"
		    end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
		    vim.keymap.set({ "n", "v" }, "[c", function()
			    if vim.wo.diff then
				    return "[c"
			    end
			    vim.schedule(function()
				    gs.prev_hunk()
			    end)
			    return "<Ignore>"
		    end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
	    end,
    }
  },

  -- Show possible keybinds
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {}
  },

  -- Set Lualine as statusline
  {
	"nvim-lualine/lualine.nvim",
	opts = {
	    options = {
		icons_enabled = false,
		component_separators = "|",
	        section_separators = ""
	    }
	}
  },

  {
  -- Indent blank lines too
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl"
  },

  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
  },

  -- Show treesitter information directly
  -- :TSPlaygroundToggle
  "nvim-treesitter/playground",

  -- Haskell language server
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    version = "^3", -- until Update, set this number before the .yaml in stack.yaml < 22 "https://raw.githubusercontent.com/commercialhaskell/stackage-snapshots/master/lts/21/21.yaml"
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  },

  -- Scala metals
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "neoclide/coc.nvim",
  branch = "release",
  },

  -- LSP Config and plugins 
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim",tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
  },

  "nvim-lua/plenary.nvim", -- required for harpoon 
  "ThePrimeagen/harpoon",

  -- Show files on the left
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- Auto complete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",
    },
  },

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup({ -- Currently default config
    prompt_func_return_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },
    prompt_func_param_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
})
    end,
  },

  -- Auto write every change
  -- Helpful for Rust + Bacon
  "beauwilliams/AutoWrite.vim",
}

local opts = {}

require("lazy").setup(plugins, opts)
