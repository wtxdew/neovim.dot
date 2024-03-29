local M = {}

local isColemak = 0

-- local gejeric_opts_any = { noremap = true, silent = true }
-- local generic_opts = {
--   insert_mode = generic_opts_any,
--   normal_mode = generic_opts_any,
--   visual_mode = generic_opts_any,
--   visual_block_mode = generic_opts_any,
--   command_mode = generic_opts_any,
--   term_mode = { silent = true },
-- }
-- local mode_adapters = {
--   insert_mode = "i",
--   normal_mode = "n",
--   term_mode = "t",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   command_mode = "c",
-- }

---@usage change or add keymappings for insert mode
local insert_mode = {
  -- 'jk' & 'kj' for quitting insert mode
  ["jk"] = "<ESC>",
  ["kj"] = "<ESC>",
  ["<C-b>"] = "<Left>",
}

local normal_mode = {
  -- Better window movement
  ["<C-h>"] = "<C-w>h",
  ["<C-j>"] = "<C-w>j",
  ["<C-k>"] = "<C-w>k",
  ["<C-l>"] = "<C-w>l",

  -- Resize with arrows
  ["<C-S-Up>"] = ":resize -2<CR>",
  ["<C-S-Down>"] = ":resize +2<CR>",
  ["<C-S-Left>"] = ":vertical resize -2<CR>",
  ["<C-S-Right>"] = ":vertical resize +2<CR>",

  -- Tab switch buffer
  ["<S-l>"] = ":BufferLineCycleNext<CR>",
  ["<S-h>"] = ":BufferLineCyclePrev<CR>",

  -- QuickFix
  ["]q"] = ":cnext<CR>",
  ["[q"] = ":cprev<CR>",
  ["<C-q>"] = ":call QuickFixToggle()<CR>",

  ["<C-t>"] = ":ToggleTerm  direction=float<CR>",
  ["<C-\\>"] = ":ToggleTerm  direction=horizontal<CR>",
  ["<C-s>"] = ":w<cr>",

  --  lsp
  ["gd"] = ":lua vim.lsp.buf.definition()<CR>", ["<F6>"] = ":set ft=sh<CR>",
}

---@usage change or add keymappings for terminal mode
local term_mode = {
  -- Terminal window navigation
  ["<C-h>"] = "<C-\\><C-N><C-w>h",
  ["<C-j>"] = "<C-\\><C-N><C-w>j",
  ["<C-k>"] = "<C-\\><C-N><C-w>k",
  ["<C-l>"] = "<C-\\><C-N><C-w>l",
  ["<C-t>"] = "<CMD>:ToggleTerm<CR>",
  ["<C-\\>"] = "<CMD>:ToggleTerm<CR>",
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
  if isColemak then
    -- M.set_colemak()
  end
end

function M.set_colemak()
    -- hnei
    vim.api.nvim_set_keymap('n', 'n', 'j', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', 'e', 'k', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', 'i', 'l', {noremap = true, silent = true})
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
