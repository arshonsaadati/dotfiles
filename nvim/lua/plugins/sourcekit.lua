return {
    {
        "neovim/nvim-lspconfig",
        opts = function(_, opts)
            opts.servers = opts.servers or {}
            -- Add sourcekit to the list of servers with minimal config
            opts.servers.sourcekit = {
                -- Let lspconfig use its default root_dir detection
                -- which should work for Swift projects
            }
        end,
    },
}
