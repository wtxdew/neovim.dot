local M = {}

local config= {
    options = {
        icons_enabled = true,
        theme = 'ayu_light',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'filename',
                file_status = true,
                newfile_status = true,
                path = 1, -- 0 = relative, 1 = absolute, 2 = relative from cwd
                symbols = {
                    modified = '[+]',      -- Text to show when the file is modified.
                    readonly = '[R]',      -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]',     -- Text to show for newly created file before first write
                }
            }
        },
        lualine_x = {'searchcount', 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = { },
    extensions = {}
}

M.Setup = function()
    require('lualine').setup(config)
end

return M
