lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.transparent_window = false

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.global_statusline = true
lvim.builtin.task_runner = "async_tasks"
lvim.builtin.tree_provider = "nvimtree" -- can be "neo-tree" or "nvimtree" or ""
lvim.builtin.tag_provider = "symbols-outline" -- change this to use different tag providers ( symbols-outline or vista )

require("user.builtin").config()

lvim.builtin.custom_statusline = {
    active = true
}
lvim.builtin.sidebar = {
    active = false
}
lvim.builtin.lastplace = {
    active = false
}
lvim.builtin.persistence = {
    active = true
}
lvim.builtin.harpoon = {
    active = true
}
lvim.builtin.editorconfig = {
    active = true
}
lvim.builtin.cursorline = {
    active = true
}
lvim.builtin.refactoring = {
    active = true
}
lvim.builtin.parentheses_rainbow = {
    active = true
}

lvim.builtin.smooth_scroll = "cinnamon"

lvim.builtin.treesitter.ensure_installed = {"bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx",
                                            "css", "rust", "java", "yaml"}
lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true

local user = os.getenv "USER"
if user and user == "eubyt" then
    lvim.transparent_window = true
end

if lvim.builtin.custom_statusline.active then
    require("user.lualine").config()
end

require("user.null_ls").config()
require("user.plugins").config()
require("user.keybindings").config()

