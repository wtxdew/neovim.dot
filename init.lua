-- Leader set
vim.g.mapleader = " "

-- Load Plugins
local plugins = require("plugins")
require("plugin-loader").init()
require("plugin-loader").load { plugins }

require("core.autocmd")
require("core.keymap").load_defaults()
require("core.options").load_default_options()
require("core.commands").load_default()

vim.cmd("colorscheme dayfox")
-- vim.cmd("colorscheme onedark")
