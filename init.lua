-- Load core setting
require ("core")

vim.g.copilot_node_command = "/gpfs/home/had/wutong/.local/download/node/bin/node"
-- vim.cmd("colorscheme dawnfox")
vim.cmd[[colorscheme tokyonight-day]]

-- vim.cmd("colorscheme onedark")

require("lsp.setup")

  -- Bad Apple 
  -- {'vim-denops/denops.vim'},
  -- {'ryoppippi/bad-apple.vim'},
