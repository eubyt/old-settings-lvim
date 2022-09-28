local M = {}

local function set_boilerplate()
    lvim.builtin.which_key.mappings["B"] = {
        name = "+Boilerplate",
        -- Create react app
        r = {"<cmd>lua require('user.boilerplate').create_react_app()<CR>", "Create React App"}

    }
end

local function set_harpoon_keymaps()
    lvim.keys.normal_mode["<C-Space>"] = "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>"
    lvim.keys.normal_mode["tu"] = "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>"
    lvim.keys.normal_mode["te"] = "<cmd>lua require('harpoon.term').gotoTerminal(2)<CR>"
    lvim.keys.normal_mode["cu"] = "<cmd>lua require('harpoon.term').sendCommand(1, 1)<CR>"
    lvim.keys.normal_mode["ce"] = "<cmd>lua require('harpoon.term').sendCommand(1, 2)<CR>"

    lvim.builtin.which_key.mappings["a"] = {"<cmd>lua require('harpoon.mark').add_file()<CR>", "Add Mark"}
    lvim.builtin.which_key.mappings["<leader>"] = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon"}

    local whk_status, whk = pcall(require, "which-key")
    if not whk_status then
        return
    end
    whk.register {
        ["<leader>1"] = {"<CMD>lua require('harpoon.ui').nav_file(1)<CR>", "goto1"},
        ["<leader>2"] = {"<CMD>lua require('harpoon.ui').nav_file(2)<CR>", "goto2"},
        ["<leader>3"] = {"<CMD>lua require('harpoon.ui').nav_file(3)<CR>", "goto3"},
        ["<leader>4"] = {"<CMD>lua require('harpoon.ui').nav_file(4)<CR>", "goto4"}
    }
end

M.config = function()
    lvim.keys.normal_mode["<C-z>"] = ":u<cr>"
    lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
    lvim.keys.normal_mode["<C-q>"] = ":q<cr>"
    lvim.keys.normal_mode["<C-a>"] = "gg0vG$"

    lvim.keys.insert_mode["<C-z>"] = "<C-o>u"
    lvim.keys.insert_mode["<C-q>"] = ":q<cr>"
    lvim.keys.insert_mode["<C-v>"] = "<C-R>+"
    lvim.keys.insert_mode["<C-x>"] = "+x"

    lvim.keys.visual_mode["<C-c>"] = "+y"
    lvim.keys.visual_mode["<C-v>"] = "<C-R>+"
    lvim.keys.visual_mode["<C-x>"] = "+x"
    lvim.keys.visual_mode["<C-a>"] = "<Esc>gg0vG$"

    lvim.lsp.buffer_mappings.normal_mode["ga"] = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action"}

    if lvim.builtin.harpoon.active then
        set_harpoon_keymaps()
    end

    set_boilerplate()

    if lvim.builtin.persistence then
        lvim.builtin.which_key.mappings["q"] = {
            name = "Quit",
            d = {"<cmd>lua require('persistence').stop()<cr> | :qa!<cr>", "Quit without saving session"},
            l = {"<cmd>lua require('persistence').load(last=true)<cr>", "Restore last session"},
            s = {"<cmd>lua require('persistence').load()<cr>", "Restore for current dir"}
        }
    end

    lvim.builtin.which_key.mappings[";"] = {"<cmd>Alpha<CR>", "Dashboard"}
    lvim.builtin.which_key.mappings["P"] = {"<cmd>Telescope projects<CR>", "Projects"}
    lvim.builtin.which_key.mappings["N"] = {"<cmd>Telescope file_create<CR>", "Create new file"}

    if lvim.builtin.tag_provider == "symbols-outline" then
        lvim.builtin.which_key.mappings["o"] = {"<cmd>SymbolsOutline<cr>", "Symbol Outline"}
    end

    if lvim.builtin.minimap.active then
        lvim.builtin.which_key.mappings["m"] = {"<cmd>MinimapToggle<cr>", "Minimap"}
    end
end

return M
