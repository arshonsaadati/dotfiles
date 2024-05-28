-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.api.nvim_set_keymap('n', '<Leader>o', 'o<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>O', 'O<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.keymap.set("i", "kj", "<Esc>", { noremap = true })
vim.keymap.set("c", "kj", "<Esc>", { noremap = true })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- don't clear register when pasting over visual selection
vim.keymap.set("x", "<leader>p", [["_dP]])
-- center the screen when jumping up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

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

-- Set up a custom hotkey for quitting Neovim
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })
-- delete line with space d
vim.keymap.set('n', '<leader>d', '"_dd')
