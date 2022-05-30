local M = {}

-- local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"
-- function _G.join_paths(...)
--   local result = table.concat({ ... }, path_sep)
--   return result
-- end

function _G.get_cache_dir()
  local nvim_cache_dir = os.getenv "NVIM_CACHE_DIR"
  if not nvim_cache_dir then
    return vim.fn.stdpath "cache"
  end
  return nvim_cache_dir
end

local default_options = {
  backup = false,
  background = "dark",
  writebackup = false,
  clipboard = "unnamedplus",
  cmdheight = 2, colorcolumn = "80",
  fileencoding = "utf-8",
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  showcmd = true,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true,
  timeoutlen = 250, 
  title = true,
  undodir = get_cache_dir() .. "/undo", 
  undofile = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  number = true,
  relativenumber = false,
  numberwidth = 2,
  signcolumn = "yes",
  scrolloff = 8, 
}

function M.load_default_options ()
  for key, val in pairs(default_options) do
    vim.opt[key] = val
  end
end
return M
