local M = {}

M.config = function()
	vim.api.nvim_command("set nofoldenable")
	vim.api.nvim_command("set foldmethod=expr")
	vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

	require("nvim-treesitter.configs").setup({
		ensure_installed = {"cpp", "lua", "c", "python", "make", "bash"},
		highlight = { 
      enable = true, 
      additional_vim_regex_highlighting = true,
      disable = { "vim" } 
    },
		textobjects = {
			select = {
				enable = false,
			},
      swap = {
        enable = false,
      },
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
			max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
		},
		context_commentstring = { enable = true, enable_autocmd = false },
		matchup = { enable = true },
	})
	require("nvim-treesitter.install").prefer_git = true
	local parsers = require("nvim-treesitter.parsers").get_parser_configs()
	for _, p in pairs(parsers) do
		p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
	end
end

M.setup = function()
  M.config()
  -- require("nvim-treesitter.configs").setup(M.config())
end

return M
