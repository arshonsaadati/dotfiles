require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "tpope/vim-commentary",
    "ThePrimeagen/vim-be-good",
    "mattn/emmet-vim",
    "nvim-tree/nvim-tree.lua",
    'stevearc/aerial.nvim',
    "nvim-tree/nvim-web-devicons",
    "ellisonleao/gruvbox.nvim",
    "norcalli/nvim-colorizer.lua",
    "dracula/vim",
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },
    "vim-test/vim-test",
    "HiPhish/rainbow-delimiters.nvim",
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
    },
    "lewis6991/gitsigns.nvim",
    "preservim/vimux",
    "christoomey/vim-tmux-navigator",
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },
    "tpope/vim-fugitive",
    "tpope/vim-surround",
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
    },
    'f-person/git-blame.nvim',
    "stevearc/oil.nvim",
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",
            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            lang = "rust",
            hooks = {
                ["question_enter"] = {
                    function()
                        local file_extension = vim.fn.expand("%:e")
                        if file_extension == "rs" then
                            local target_dir = vim.fn.stdpath("data") .. "/leetcode"
                            local output_file = target_dir .. "/rust-project.json"

                            if vim.fn.isdirectory(target_dir) == 1 then
                                local crates = ""
                                local next = ""

                                local rs_files = vim.fn.globpath(target_dir, "*.rs", false, true)
                                for _, f in ipairs(rs_files) do
                                    local file_path = f
                                    crates = crates ..
                                        next ..
                                        "{\"root_module\": \"" .. file_path .. "\",\"edition\": \"2021\",\"deps\": []}"
                                    next = ","
                                end

                                if crates == "" then
                                    print("No .rs files found in directory: " .. target_dir)
                                    return
                                end

                                local sysroot_src = vim.fn.system("rustc --print sysroot"):gsub("\n", "") ..
                                    "/lib/rustlib/src/rust/library"

                                local json_content = "{\"sysroot_src\": \"" ..
                                    sysroot_src .. "\", \"crates\": [" .. crates .. "]}"

                                local file = io.open(output_file, "w")
                                if file then
                                    file:write(json_content)
                                    file:close()

                                    local clients = vim.lsp.get_clients()
                                    local rust_analyzer_attached = false
                                    for _, client in ipairs(clients) do
                                        if client.name == "rust_analyzer" then
                                            rust_analyzer_attached = true
                                            break
                                        end
                                    end

                                    if rust_analyzer_attached then
                                        vim.cmd("LspRestart rust_analyzer")
                                    end
                                else
                                    print("Failed to open file: " .. output_file)
                                end
                            else
                                print("Directory " .. target_dir .. " does not exist.")
                            end
                        end
                    end,
                },
            }
        },
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    -- Swift
    {
        "wojciech-kulik/xcodebuild.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-tree.lua",         -- (optional) to manage project files
            "stevearc/oil.nvim",               -- (optional) to manage project files
            "nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
        },

    },
    "stevearc/conform.nvim",
    -- completion
    "hrsh7th/nvim-cmp",
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "github/copilot.vim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        }
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "vinnymeller/swagger-preview.nvim",
        run = "npm install -g swagger-ui-watcher",
    },
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
    },
    {
        'renerocksai/telekasten.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', "nvim-telekasten/calendar-vim" }
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
})
