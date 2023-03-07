local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        vim.pretty_print(server_name)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["lua_ls"] = function ()
        require("lsp.lua_ls").setup()
    end
}

-- vim.api.nvim_create_augroup("lsp_document_highlight", {})
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = "lsp_document_highlight",
--   buffer = vim.fn.bufnr(),
--   callback = vim.lsp.buf.document_highlight,
-- })

-- vim.api.nvim_create_autocmd("CursorMoved", {
--   group = "lsp_document_highlight",
--   buffer = vim.fn.bufnr(),
--   callback = vim.lsp.buf.clear_references,
-- })
