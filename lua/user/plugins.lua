local M = {}

M.config = function()
    lvim.plugins = {{"folke/tokyonight.nvim"}, {
        "catppuccin/nvim",
        as = "catppuccin",
        setup = function()
            vim.g.catppuccin_flavour = "mocha"
        end,
        config = function()
            require("user.theme").catppuccin()
            vim.cmd [[colorscheme catppuccin]]
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
    }, {
        "yamatsum/nvim-cursorline",
        opt = true,
        event = "BufWinEnter",
        disable = not lvim.builtin.cursorline.active
    }, {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup {
                easing_function = "quadratic",
                hide_cursor = true
            }
        end,
        event = "BufRead",
        disable = lvim.builtin.smooth_scroll ~= "neoscroll"
    }, {
        "nathom/filetype.nvim",
        config = function()
            require("user.filetype").config()
        end
    }, {
        "skywind3000/asynctasks.vim",
        requires = {{"skywind3000/asyncrun.vim"}},
        setup = function()
            vim.cmd [[
            let g:asyncrun_open = 8
            let g:asynctask_template = '~/.config/lvim/task_template.ini'
            let g:asynctasks_extra_config = ['~/.config/lvim/tasks.ini']
          ]]
        end,
        event = "BufRead",
        disable = lvim.builtin.task_runner ~= "async_tasks"
    }, {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {"MunifTanjim/nui.nvim"},
        config = function()
            require("user.neotree").config()
        end,
        disable = lvim.builtin.tree_provider ~= "neo-tree"
    }, {
        "sidebar-nvim/sidebar.nvim",
        config = function()
            require("user.sidebar").config()
        end,
        disable = not lvim.builtin.sidebar.active
    }, {
        "ThePrimeagen/refactoring.nvim",
        ft = {"typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php"},
        event = "BufRead",
        config = function()
            require("refactoring").setup {}
        end,
        disable = not lvim.builtin.refactoring.active
    }, {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("user.symbols_outline").config()
        end,
        event = "BufReadPost",
        disable = lvim.builtin.tag_provider ~= "symbols-outline"
    }}
end

return M
