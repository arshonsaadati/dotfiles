require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "tpope/vim-commentary",
    "ThePrimeagen/vim-be-good",
    "mattn/emmet-vim",
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "ellisonleao/gruvbox.nvim",
    "dracula/vim",
    "nvim-lualine/lualine.nvim",
    "nvim-treesitter/nvim-treesitter",
    "vim-test/vim-test",
    "HiPhish/rainbow-delimiters.nvim",
    "lewis6991/gitsigns.nvim",
    "preservim/vimux",
    "christoomey/vim-tmux-navigator",
    "tpope/vim-fugitive",
    "tpope/vim-surround",
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
            -- configuration goes here
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
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "vinnymeller/swagger-preview.nvim",
        run = "npm install -g swagger-ui-watcher",
    },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
})
