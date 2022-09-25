lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.builtin.time_based_themes = true
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.transparent_window = true

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

require("user.builtin").config()

lvim.builtin.fancy_statusline = {
    active = true
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

if lvim.builtin.fancy_statusline.active then
    require("user.lualine").config()
end

lvim.builtin.treesitter.ensure_installed = {"bash", "c", "javascript", "json", "lua", "python", "typescript", "tsx",
                                            "css", "rust", "java", "yaml"}
lvim.builtin.treesitter.ignore_install = {"haskell"}
lvim.builtin.treesitter.highlight.enabled = true

require("user.null_ls").config()

require("user.plugins").config()
