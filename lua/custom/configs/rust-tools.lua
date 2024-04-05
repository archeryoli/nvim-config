local on_attach = require("custom.configs.lspconfig").on_attach
local capabilities = require("custom.configs.lspconfig").capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}

return options
