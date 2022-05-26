
vim.g.mapleader = " "
require("autocmd")
-- require("plugins")
local plugins = require("plugins")
require("plugin-loader").init()
require("plugin-loader").load {plugins}
require'nvim-tree'.setup {}

vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

require("keymap").load_defaults()
require("options").load_default_options()
vim.cmd("colorscheme dayfox")
