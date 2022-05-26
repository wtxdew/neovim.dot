
vim.g.mapleader = " "
require("core")
require("plugins")
require'nvim-tree'.setup {}
require("keymap").load_defaults()
require("options").load_default_options()
vim.cmd("colorscheme dayfox")
