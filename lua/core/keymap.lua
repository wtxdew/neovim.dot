local M = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
  insert_mode = generic_opts_any,
  normal_mode = generic_opts_any,
  visual_mode = generic_opts_any,
  visual_block_mode = generic_opts_any,
  command_mode = generic_opts_any,
  term_mode = { silent = true },
}
local mode_adapters = {
  insert_mode = "i",
  normal_mode = "n",
  term_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c",
}

---@usage change or add keymappings for insert mode
local insert_mode = {
  -- 'jk' & 'kj' for quitting insert mode
  ["jk"] = "<ESC>",
  ["kj"] = "<ESC>",
}

local normal_mode = {
  -- Better window movement
  ["<C-h>"] = "<C-w>h",
  ["<C-j>"] = "<C-w>j",
  ["<C-k>"] = "<C-w>k",
  ["<C-l>"] = "<C-w>l",

  -- Resize with arrows
  ["<C-Up>"] = ":resize -2<CR>",
  ["<C-Down>"] = ":resize +2<CR>",
  ["<C-Left>"] = ":vertical resize -2<CR>",
  ["<C-Right>"] = ":vertical resize +2<CR>",

  -- Tab switch buffer
  ["<S-l>"] = ":BufferLineCycleNext<CR>",
  ["<S-h>"] = ":BufferLineCyclePrev<CR>",

  -- QuickFix
  ["]q"] = ":cnext<CR>",
  ["[q"] = ":cprev<CR>",
  ["<C-q>"] = ":call QuickFixToggle()<CR>",

  ["<C-s>"] = ":w<cr>",
}

---@usage change or add keymappings for terminal mode
local term_mode = {
  -- Terminal window navigation
  ["<C-h>"] = "<C-\\><C-N><C-w>h",
  ["<C-j>"] = "<C-\\><C-N><C-w>j",
  ["<C-k>"] = "<C-\\><C-N><C-w>k",
  ["<C-l>"] = "<C-\\><C-N><C-w>l",
}

---@usage change or add keymappings for visual mode
local visual_mode = {
  -- Better indenting
  ["<"] = "<gv",
  [">"] = ">gv",
}

---@usage change or add keymappings for visual block mode
local visual_block_mode = {
}

---@usage change or add keymappings for command mode
local command_mode = {
  -- navigate tab completion with <c-j> and <c-k>
  -- runs conditionally
  ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
  ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
}

-- Load the default keymappings
function M.load_defaults()
  M.set_keymap(normal_mode, "n")
  M.set_keymap(insert_mode, "i")
  M.set_keymap(term_mode, "t")
  M.set_keymap(visual_mode, "v")
  M.set_keymap(visual_block_mode, "x")
  M.set_keymap(command_mode, "c")
end

function M.set_keymap(keymaps, mode_short)
  for key, val in pairs(keymaps) do 
    local opt = { noremap = true, silent = true }
    if type(val) == "table" then
      opt = val[2]
      val = val[1]
    end
    if val then
      vim.api.nvim_set_keymap(mode_short, key, val, opt)
    else
      pcall(vim.api.nvim_del_keymap, mode_short, key)
    end
  end
end

return M
