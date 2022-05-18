
vim.g.mapleader = " "
require("core")
require("plugins")
require("keymap").load_defaults()
require("options").load_default_options()
vim.cmd("colorscheme dayfox")
