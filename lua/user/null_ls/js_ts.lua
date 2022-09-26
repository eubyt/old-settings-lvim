local M = {}

local eslintrc = {".eslintrc", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.js"}
local prettier = {"prettier.config.js", ".prettierrc", ".prettierrc.json", ".prettierrc.yaml", ".prettierrc.yml",
                  ".prettierrc.js"}

M.config = function(nls)
    local sources = {}

    --- formatting ---
    ------------------

    -- prettierd
    table.insert(sources, nls.builtins.formatting.prettierd.with {
        condition = function(utils)
            return utils.root_has_file(prettier)
        end,
        prefer_local = "node_modules/.bin"
    })

    -- eslint_d
    table.insert(sources, nls.builtins.formatting.eslint_d.with {
        condition = function(utils)
            return utils.root_has_file(eslintrc)
        end,
        prefer_local = "node_modules/.bin"
    })

    --- diagnostics ---
    --------------------

    -- eslint_d
    table.insert(sources, nls.builtins.diagnostics.eslint_d.with {
        condition = function(utils)
            return utils.root_has_file(eslintrc)
        end,
        prefer_local = "node_modules/.bin"
    })

    --- code_actions ---
    --------------------

    -- eslint_d
    table.insert(sources, nls.builtins.code_actions.eslint_d.with {
        condition = function(utils)
            return utils.root_has_file(eslintrc)
        end,
        prefer_local = "node_modules/.bin"
    })

    return sources
end

return M
