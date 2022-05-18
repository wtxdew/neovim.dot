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
    ["<C-s>"] = ":w<cr>",
}

-- Load the default keymappings
function M.load_defaults()
	M.set_keymap(normal_mode, "n")
	M.set_keymap(insert_mode, "i")
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
