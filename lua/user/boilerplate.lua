local M = {}

M.create_react_app = function()
    local app_name = vim.fn.input("Enter app name: ")
    local app_path = vim.fn.input("Enter app path: ")
    local use_typescript = vim.fn.input("Use typescript? (y/n): ")

    if use_typescript == "y" then
        use_typescript = true
    else
        use_typescript = false
    end

    if vim.fn.isdirectory(app_path) == 0 then
        vim.fn.mkdir(app_path, "p")
    end

    local cmd = "npx create-react-app " .. app_name .. " --template typescript"
    if not use_typescript then
        cmd = "npx create-react-app " .. app_name
    end

    if app_path ~= "" then
        cmd = cmd .. " --directory " .. app_path
    end

    cmd = cmd .. " --skip-git"

    vim.fn.jobstart(cmd, {
        on_exit = function(_, code)
            if code == 0 then
                vim.cmd("tabnew " .. app_name)
                print("React app created successfully")
            else
                print("Error creating react app")
            end
        end
    })
end

return M
