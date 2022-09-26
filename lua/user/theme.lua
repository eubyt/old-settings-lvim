local M = {}

M.vscode = function()
    local c = require('vscode.colors')
    require('vscode').setup({
        transparent = lvim.transparent_window,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
            vscLineNumber = '#FFFFFF'
        },
        group_overrides = {
            Cursor = {
                fg = c.vscDarkBlue,
                bg = c.vscLightGreen,
                bold = true
            }
        }
    })
end

M.catppuccin = function()
    local catppuccin = require "catppuccin"
    local opts = {
        transparent_background = lvim.transparent_window,
        term_colors = false,
        styles = {
            comments = {},
            keywords = {"italic"}
        },
        compile = {
            enabled = true, -- NOTE: make sure to run `:CatppuccinCompile`
            path = vim.fn.stdpath "cache" .. "/catppuccin"
        },
        dim_inactive = {
            enabled = lvim.builtin.global_statusline,
            shade = "dark",
            percentage = 0.15
        },
        integrations = {
            cmp = true,
            fidget = true,
            lsp_trouble = true,
            telescope = true,
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = {"italic"},
                    hints = {},
                    warnings = {"italic"},
                    information = {}
                },
                underlines = {
                    errors = {"undercurl"},
                    hints = {},
                    warnings = {"undercurl"},
                    information = {}
                }
            },
            dap = {
                enabled = lvim.builtin.dap.active,
                enable_ui = lvim.builtin.dap.active
            },
            indent_blankline = {
                enabled = true,
                colored_indent_levels = true
            },
            gitsigns = lvim.builtin.gitsigns.active,
            notify = lvim.builtin.notify.active,
            nvimtree = lvim.builtin.nvimtree.active,
            overseer = lvim.builtin.task_runner == "overseer",
            symbols_outline = lvim.builtin.tag_provider == "symbols-outline",
            which_key = lvim.builtin.which_key.active,
            lightspeed = lvim.builtin.motion_provider == "lightspeed",
            hop = lvim.builtin.motion_provider == "hop"
        },
        highlight_overrides = {
            mocha = {
                NormalFloat = {
                    fg = "#CDD6F4",
                    bg = "#151521"
                }
            }
        }
    }
    if lvim.transparent_window then
        local colors = require("catppuccin.palettes").get_palette()
        colors.none = "NONE"
        opts.custom_highlights = {
            Comment = {
                fg = colors.overlay1
            },
            LineNr = {
                fg = colors.overlay1
            },
            CursorLine = {
                bg = colors.none
            },
            CursorLineNr = {
                fg = colors.lavender
            },
            DiagnosticVirtualTextError = {
                bg = colors.none
            },
            DiagnosticVirtualTextWarn = {
                bg = colors.none
            },
            DiagnosticVirtualTextInfo = {
                bg = colors.none
            },
            DiagnosticVirtualTextHint = {
                bg = colors.none
            }
        }
    end
    catppuccin.setup(opts)
end

M.colors = {
    rosewater = "#F5E0DC",
    flamingo = "#F2CDCD",
    violet = "#DDB6F2",
    pink = "#F5C2E7",
    red = "#F28FAD",
    maroon = "#E8A2AF",
    orange = "#F8BD96",
    yellow = "#FAE3B0",
    green = "#ABE9B3",
    blue = "#96CDFB",
    cyan = "#89DCEB",
    teal = "#B5E8E0",
    lavender = "#C9CBFF",
    white = "#D9E0EE",
    gray2 = "#C3BAC6",
    gray1 = "#988BA2",
    gray0 = "#6E6C7E",
    black4 = "#575268",
    bg_br = "#302D41",
    bg = "#302D41",
    surface1 = "#302D41",
    bg_alt = "#1E1E2E",
    fg = "#D9E0EE",
    black = "#1A1826",
    git = {
        add = "#ABE9B3",
        change = "#96CDFB",
        delete = "#F28FAD",
        conflict = "#FAE3B0"
    }
}

return M
