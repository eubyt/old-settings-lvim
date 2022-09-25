local M = {}

M.config = function()
    -- Dashboard
    lvim.builtin.alpha.mode = "custom"
    local alpha_opts = require("user.dashboard").config()
    lvim.builtin.alpha["custom"] = {
        config = alpha_opts
    }
end

return M
