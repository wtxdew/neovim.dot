local M = {}

function M.setup()
    require "telescope".setup ({
        pickers = {
            colorscheme = {
                enable_preview = true
            }
        }
    })
end

-- require("telescope").load_extension "file_browser"

return M
