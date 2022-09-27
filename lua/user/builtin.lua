local M = {}
local kind = require "user.lsp_kind"

M.config = function()
    -- Dashboard
    lvim.builtin.alpha.mode = "custom"
    local alpha_opts = require("user.dashboard").config()
    lvim.builtin.alpha["custom"] = {
        config = alpha_opts
    }

    lvim.builtin.lualine.active = true
    lvim.builtin.lualine.sections.lualine_b = {"branch"}

    lvim.lsp.diagnostics.underline = true

    lvim.lsp.diagnostics.float.header = ""
    lvim.lsp.diagnostics.float.prefix = ""
    lvim.lsp.diagnostics.float.source = "always"
    lvim.lsp.diagnostics.float.style = "minimal"

    lvim.lsp.float.style = "minimal"

    lvim.lsp.diagnostics.severity_sort = true
    lvim.lsp.diagnostics.signs.active = true

    lvim.lsp.diagnostics.signs.values = {{
        name = "DiagnosticSignError",
        text = kind.icons.error
    }, {
        name = "DiagnosticSignWarn",
        text = kind.icons.warn
    }, {
        name = "DiagnosticSignInfo",
        text = kind.icons.info
    }, {
        name = "DiagnosticSignHint",
        text = kind.icons.hint
    }}
end

return M
