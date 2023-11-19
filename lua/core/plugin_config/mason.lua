-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require("mason").setup()
require("mason-lspconfig").setup()

local servers = {
  clangd = {},
  -- gopls = {}, -- Couldn't install
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  html = { filetypes = { "html", "twig", "hbs"} },

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

-- For some reson this has to be between the two Mason blocks, kickstart knows that better than me
--
-- Setup neovim lua configuration
require("neodev").setup()

-- Ensure the servers above are installed
local mason_lspconfig = require "mason-lspconfig"

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
