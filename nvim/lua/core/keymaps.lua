-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })


vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- don't clear register when pasting over visual selection
vim.keymap.set("x", "<leader>p", [["_dP]])
-- center the screen when jumping up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Show diagnostics
vim.keymap.set('n', '<leader>y', vim.diagnostic.open_float)

-- Set up remaps for hjkl navigation in Insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })

-- Set up remaps for Ctrl-w and Ctrl-b in Insert mode
vim.api.nvim_set_keymap('i', '<C-w>', '<C-o>w', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-b>', '<C-o>b', { noremap = true })

-- Set up remaps for hjkl navigation in Command mode
vim.api.nvim_set_keymap('c', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-l>', '<Right>', { noremap = true })

-- Set up remaps for hjkl navigation in Insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true })

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- xcodebuild keymaps
vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show Xcodebuild Actions" })
vim.keymap.set("n", "<leader>Xf", "<cmd>XcodebuildProjectManager<cr>", { desc = "Show Project Manager Actions" })
vim.keymap.set("n", "<leader>Xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>XB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "Build For Testing" })
vim.keymap.set("n", "<leader>Xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
vim.keymap.set("n", "<leader>Xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
vim.keymap.set("v", "<leader>Xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "Run Selected Tests" })
vim.keymap.set("n", "<leader>XT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
vim.keymap.set("n", "<leader>Xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
vim.keymap.set("n", "<leader>Xc", "<cmd>XcodebuildToggleCodeCoverage<cr>", { desc = "Toggle Code Coverage" })
vim.keymap.set("n", "<leader>XC", "<cmd>XcodebuildShowCodeCoverageReport<cr>", { desc = "Show Code Coverage Report" })
vim.keymap.set("n", "<leader>Xe", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle Test Explorer" })
vim.keymap.set("n", "<leader>Xs", "<cmd>XcodebuildFailingSnapshots<cr>", { desc = "Show Failing Snapshots" })
vim.keymap.set("n", "<leader>Xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
vim.keymap.set("n", "<leader>Xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
-- Set up a custom hotkey for quitting Neovim
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })
-- delete line with space d
vim.keymap.set('n', '<leader>dd', '"_dd')

-- Telekasten keymaps
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used Telekasten functions
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

-- Open LazyGit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- Toggle Aerial view
vim.keymap.set("n", "<c-m>", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial view" })

-- Toggle NvimTree
vim.keymap.set('n', '<c-n>', ':NvimTreeToggle<CR>')
