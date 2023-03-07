
-- Leader set
vim.g.mapleader = " "

local plugins = require("plugins.plugins")

require("core.plugin-loader").init()
require("core.plugin-loader").load { plugins }
require("core.autocmd").setup()
require("core.keymap").load_defaults()
require("core.options").load_default_options()
require("core.commands").load_default()
