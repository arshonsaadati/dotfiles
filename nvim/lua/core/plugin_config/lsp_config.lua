require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "pyright", "clangd", "tsserver", "rust_analyzer" }
})

local lspconfig = require('lspconfig')

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

require("lspconfig").sourcekit.setup({
    root_dir = function(filename, _)
        local util = require("lspconfig.util")

        return util.root_pattern("buildServer.json")(filename)
            or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
            or util.find_git_ancestor(filename)
            or util.root_pattern("Package.swift")(filename)
            or util.root_pattern("*.swift")(filename)
    end,
    capabilities = {
        require("cmp_nvim_lsp").default_capabilities(),
    },
})

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.stdpath "config" .. "/lua"] = true,
                },
            },
        },
    }
}
-- Change this to your actual download path.
--local path_to_download = '/Users/arshonsaadati/Documents/omnisharp-osx'
--
--require('lspconfig').omnisharp.setup {
--    cmd = {
--        'mono',
--        '--assembly-loader=strict',
--        path_to_download .. '/omnisharp/OmniSharp.exe',
--    },
--    -- Assuming you have an on_attach function. Delete this line if you don't.
--    on_attach = on_attach,
--    use_mono = true,
--}
require("lspconfig").clangd.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").tailwindcss.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        -- Map 'gD' to go to the declaration of the symbol under the cursor
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

        -- Map 'gd' to go to the definition of the symbol under the cursor
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

        -- Map 'K' to show hover information about the symbol under the cursor
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        -- Map 'gi' to go to the implementation of the symbol under the cursor
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        -- Map '<space>wa' to add the current folder to the workspace
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)

        -- Map '<space>wr' to remove the current folder from the workspace
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)

        -- Map '<space>wl' to list the folders in the workspace
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        -- Map '<space>D' to go to the type definition of the symbol under the cursor
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)

        -- Map '<space>rn' to rename the symbol under the cursor
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

        -- Map '<space>ca' to show code actions available at the cursor position
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

        -- Map 'gr' to show references to the symbol under the cursor
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

        -- Map '<space>f' to format the current buffer
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
