local M = {}

M.config = function()
    lvim.plugins = {{
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            require("user.theme").rose_pine()
            vim.cmd [[colorscheme rose-pine]]
        end,
        cond = function()
            local _time = os.date "*t"
            return (_time.hour >= 1 and _time.hour < 9) and lvim.builtin.time_based_themes
        end
    }, {
        "catppuccin/nvim",
        as = "catppuccin",
        setup = function()
            vim.g.catppuccin_flavour = "mocha"
        end,
        config = function()
            require("user.theme").catppuccin()
            vim.cmd [[colorscheme catppuccin]]
        end,
        cond = function()
            local _time = os.date "*t"
            return (_time.hour >= 17 and _time.hour < 21) and lvim.builtin.time_based_themes
        end
    }, {
        "rebelot/kanagawa.nvim",
        config = function()
            require("user.theme").kanagawa()
            vim.cmd [[colorscheme kanagawa]]
        end,
        cond = function()
            local _time = os.date "*t"
            return ((_time.hour >= 21 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1)) and
                       lvim.builtin.time_based_themes
        end
    }, {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("user/lsp_signature").config()
        end,
        event = {"BufRead", "BufNew"}
    }, {
        "vladdoster/remember.nvim",
        config = function()
            require("remember").setup {}
        end,
        event = "BufWinEnter",
        disable = not lvim.builtin.lastplace.active
    }, {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("user.todo_comments").config()
        end,
        event = "BufRead"
    }, {
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(get_cache_dir() .. "/sessions/"), -- directory where session files are saved
                options = {"buffers", "curdir", "tabpages", "winsize"} -- sessionoptions used for saving
            }
        end,
        disable = not lvim.builtin.persistence.active
    }, {
        "folke/zen-mode.nvim",
        config = function()
            require("user.zen").config()
        end,
        event = "BufRead"
    }, {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("user.colorizer").config()
        end,
        event = "BufRead"
    }, {
        "ThePrimeagen/harpoon",
        requires = {{"nvim-lua/plenary.nvim"}, {"nvim-lua/popup.nvim"}},
        disable = not lvim.builtin.harpoon.active
    }, {
        "editorconfig/editorconfig-vim",
        event = "BufRead",
        disable = not lvim.builtin.editorconfig.active
    }}
end

return M
