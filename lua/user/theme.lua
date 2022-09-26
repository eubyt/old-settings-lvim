local M = {}
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
    catppuccin_colors = {
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
}
M.current_colors = function()
    return M.colors.catppuccin_colors
end

M.hi_colors = function()
    local colors = {
        bg = "#16161D",
        bg_alt = "#1F1F28",
        fg = "#DCD7BA",
        green = "#76946A",
        red = "#E46876"
    }
    local color_binds = {
        bg = {
            group = "NormalFloat",
            property = "background"
        },
        bg_alt = {
            group = "Cursor",
            property = "foreground"
        },
        fg = {
            group = "Cursor",
            property = "background"
        },
        green = {
            group = "diffAdded",
            property = "foreground"
        },
        red = {
            group = "diffRemoved",
            property = "foreground"
        }
    }
    local function get_hl_by_name(name)
        local ret = vim.api.nvim_get_hl_by_name(name.group, true)
        return string.format("#%06x", ret[name.property])
    end

    for k, v in pairs(color_binds) do
        local found, color = pcall(get_hl_by_name, v)
        if found then
            colors[k] = color
        end
    end
    return colors
end

M.telescope_theme = function()
    local function set_bg(group, bg)
        vim.cmd("hi " .. group .. " guibg=" .. bg)
    end

    local function set_fg_bg(group, fg, bg)
        vim.cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
    end

    local colors = M.hi_colors()
    set_fg_bg("NormalFloat", colors.fg, colors.bg)
    set_fg_bg("FloatBorder", colors.fg, colors.bg)
    set_fg_bg("TelescopeBorder", colors.bg_alt, colors.bg)
    set_fg_bg("TelescopePromptBorder", colors.bg, colors.bg)
    set_fg_bg("TelescopePromptNormal", colors.fg, colors.bg_alt)
    set_fg_bg("TelescopePromptPrefix", colors.red, colors.bg)
    set_bg("TelescopeNormal", colors.bg)
    set_fg_bg("TelescopePreviewTitle", colors.bg, colors.green)
    set_fg_bg("LvimInfoHeader", colors.bg, colors.green)
    set_fg_bg("LvimInfoIdentifier", colors.red, colors.bg_alt)
    set_fg_bg("TelescopePromptTitle", colors.bg, colors.red)
    set_fg_bg("TelescopeResultsTitle", colors.bg, colors.bg)
    set_fg_bg("TelescopeResultsBorder", colors.bg, colors.bg)
    set_bg("TelescopeSelection", colors.bg_alt)
end

return M
