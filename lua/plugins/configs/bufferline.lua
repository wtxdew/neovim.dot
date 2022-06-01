local M = {}

local options = {
  close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
  right_mouse_command = "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
  indicator_icon = "▎",
  name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
    -- remove extension from markdown files for example
    if buf.name:match "%.md" then
      return vim.fn.fnamemodify(buf.name, ":t:r")
    end
  end,
  diagnostics = "nvim_lsp",
  diagnostics_update_in_insert = false,
  diagnostics_indicator = diagnostics_indicator,
  -- NOTE: this will be called a lot so don't do any heavy processing here
  custom_filter = custom_filter,
  offsets = {
    {
      filetype = "undotree",
      text = "Undotree",
      highlight = "PanelHeading",
      padding = 1,
    },
    {
      filetype = "NvimTree",
      text = "Explorer",
      highlight = "PanelHeading",
      padding = 1,
    },
    {
      filetype = "DiffviewFiles",
      text = "Diff View",
      highlight = "PanelHeading",
      padding = 1,
    },
    {
      filetype = "flutterToolsOutline",
      text = "Flutter Outline",
      highlight = "PanelHeading",
    },
    {
      filetype = "packer",
      text = "Packer",
      highlight = "PanelHeading",
      padding = 1,
    },
  },
  show_buffer_icons = true,
  show_buffer_close_icons = true,
  show_close_icon = false,
  show_tab_indicators = true,
  persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
  separator_style = "thin",
  enforce_regular_tabs = false,
  -- always_show_bufferline = false,
  sort_by = "id",
}

function M.setup()
  require("bufferline").setup{options = options}
end

return M
