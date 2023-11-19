-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Scala metals
local nvim_metals_group = vim.api.nvim_create_augroup("nvim_metals", { clear = true })
vim.api.nvim_create_autocmd("fileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function ()
    require("metals").initialize_or_attach({})
  end,
  group = nvim_metals_group,
})
