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

    -- integrate with nvim-ts-context-commentstring
    lvim.builtin.comment.pre_hook = function(ctx)
        if not vim.tbl_contains({"typescript", "typescriptreact"}, vim.bo.ft) then
            return
        end

        local comment_utils = require "Comment.utils"
        local type = ctx.ctype == comment_utils.ctype.line and "__default" or "__multiline"

        local location
        if ctx.ctype == comment_utils.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == comment_utils.cmotion.v or ctx.cmotion == comment_utils.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
            key = type,
            location = location
        }
    end
end

return M
