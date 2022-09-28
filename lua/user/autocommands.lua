local M = {}

local create_aucmd = vim.api.nvim_create_autocmd

M.config = function()
    vim.api.nvim_create_augroup("_lvim_user", {})

    create_aucmd("TextYankPost", {
        group = "_general_settings",
        pattern = "*",
        desc = "Highlight text on yank",
        callback = function()
            require("vim.highlight").on_yank {
                higroup = "Search",
                timeout = 40
            }
        end
    })

end

return M
