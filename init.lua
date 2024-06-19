-- Load core setting
require ("core")

-- vim.cmd("colorscheme dawnfox")
vim.cmd[[colorscheme tokyonight-day]]
-- vim.cmd("colorscheme onedark")

require("lsp.setup")

  -- Bad Apple 
  -- {'vim-denops/denops.vim'},
  -- {'ryoppippi/bad-apple.vim'},

--hi WinSeparator guifg=#3b4252
vim.cmd([[highlight WinSeparator guifg=#3b4252]])
-- vim.cmd("Copilot disable")
