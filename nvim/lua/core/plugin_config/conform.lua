local conform = require('conform')
local project_root = vim.fn.getcwd()
local compile_commands_path = project_root .. "/compile_commands.json"

conform.setup({
    formatters_by_ft = {
        swift = { "swiftformat" },
    },
    format_on_save = function(bufnr)
        -- Check for compile_commands.json and exclude .c files
        if vim.fn.filereadable(compile_commands_path) == 1 and (vim.bo[bufnr].filetype == "c" or vim.bo[bufnr].filetype == "cpp") then
            return false
        end
        -- Default behavior otherwise
        return { timeout_ms = 500, lsp_fallback = true }
    end,
    log_level = vim.log.levels.ERROR,
})
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end, { desc = "Format file or range (in visual mode)" })
