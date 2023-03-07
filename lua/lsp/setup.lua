-- local lsp_installer = require "nvim-lsp-installer"

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: language, value: config_file}
-- local servers = { sumneko_lua = require "lsp.lua", -- /lua/lsp/lua.lua
-- }
--
-- -- 自动安装 LanguageServers
-- for name, _ in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found then
--     if not server:is_installed() then
--       print("Installing " .. name)
--       server:install()
--     end
--   end
-- end

require("nvim-lsp-installer").setup {}

local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup ( require "lsp.lua".setup )
lspconfig.clangd.setup { }

vim.api.nvim_create_augroup("lsp_document_highlight", {})
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = "lsp_document_highlight",
--   buffer = vim.fn.bufnr(),
--   callback = vim.lsp.buf.document_highlight,
-- })
vim.api.nvim_create_autocmd("CursorMoved", {
  group = "lsp_document_highlight",
  buffer = vim.fn.bufnr(),
  callback = vim.lsp.buf.clear_references,
})
