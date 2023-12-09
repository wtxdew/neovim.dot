local M = {}

local config = {
    ensure_installed = {"cpp", "lua", "c", "python", "make", "bash"},
    textobjects = {
        select = {
            enable = false,
        },
        swap = {
            enable = false,
        },
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = { enable = true, enable_autocmd = false },
    matchup = { enable = true },
}

M.setup = function()
    vim.api.nvim_command("set nofoldenable")
    vim.api.nvim_command("set foldmethod=expr")
    vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

    require("nvim-treesitter.configs").setup(config)

    require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
    require("nvim-treesitter.install").prefer_git = true
    local parsers = require("nvim-treesitter.parsers").get_parser_configs()
    for _, p in pairs(parsers) do
        p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
    end
end

return M
