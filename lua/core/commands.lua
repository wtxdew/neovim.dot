local M = {}

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]

M.defaults = {
  -- {
  --   name = "IvimUpdate",
  --   fn = function()
  --       M.IvimUpdate()
  --   end
  -- },
}

-- function M:IvimUpdate()
--     -- require_clean("lvim.utils.hooks").run_pre_update()
--     local ret = require_clean("utils.git").update_base_ivim()
--     if ret then
--         require_clean("lvim.utils.hooks").run_post_update()
--     end
-- end

---
function M.Load(config)
    local common_opts = { force = true }
    for _, cmd in pairs(config) do
        local opts = vim.tbl_deep_extend("force", common_opts, cmd.opts or {})
        vim.api.nvim_create_user_command(cmd.name, cmd.fn, opts)
    end
end

function M.load_default()
    M.Load(M.defaults)
end

return M
