local M = {}

M.config = function()
    lvim.keys.normal_mode["<C-z>"] = ":u<cr>"
    lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
    lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

    lvim.keys.insert_mode["<C-z>"] = "<C-o>u"
    lvim.keys.insert_mode["<C-q>"] = ":q<cr>"
    lvim.keys.insert_mode["<C-v>"] = "<C-R>+"
    lvim.keys.insert_mode["<C-x>"] = "+x"

    lvim.keys.visual_mode["<C-c>"] = "+y"
    lvim.keys.visual_mode["<C-v>"] = "<C-R>+"
    lvim.keys.visual_mode["<C-x>"] = "+x"

end

return M
