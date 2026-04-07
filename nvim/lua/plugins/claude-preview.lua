return {
    "Cannon07/claude-preview.nvim",
    config = function()
        require("claude-preview").setup({
            diff = {
                layout     = "inline", -- "tab" (new tab) | "vsplit" (current tab) | "inline" (GitHub-style)
                labels     = { current = "CURRENT", proposed = "PROPOSED" },
                auto_close = true,     -- close diff after accept
                equalize   = true,     -- 50/50 split widths (tab/vsplit only)
                full_file  = true,     -- show full file, not just diff hunks (tab/vsplit only)
            },
        })
    end,
}
