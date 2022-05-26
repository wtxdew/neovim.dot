
-- Leader set 
vim.g.mapleader = " "

-- Load Plugins 
local plugins = require("plugins")
require("plugin-loader").init()
require("plugin-loader").load {plugins}

require("options").load_default_options()
require("keymap").load_defaults()
require("autocmd")

vim.cmd("colorscheme dayfox")
-- vim.cmd("colorscheme onedark")
