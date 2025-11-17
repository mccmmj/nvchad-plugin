-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(params)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- tsserver has been deprecated upstream; use ts_ls instead
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   init_options = {
--     preferences = {
--       disableSuggestions = true,
--     }
--   },
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports",
--     }
--   }
-- }

lspconfig.ts_ls.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
})

lspconfig.html.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
})

lspconfig.cssls.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
})

lspconfig.pylsp.setup({
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E501" },
        },
      },
    },
  },
})

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = nvlsp.capabilities,
}
