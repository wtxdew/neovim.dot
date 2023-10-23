local plugin_loader = {}

local in_headless = #vim.api.nvim_list_uis() == 0
local compile_path = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua"
-- Log = require("log")

function plugin_loader.init()
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
end

function plugin_loader.load(plugins)
	vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct


	local packer_available, lazy = pcall(require, "lazy")
	if not packer_available then
		-- Log:warn "skipping loading plugins until lazy is installed"
		return
	end

	lazy.setup(plugins)

end

return plugin_loader
