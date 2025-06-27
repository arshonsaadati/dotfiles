-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<Leader>o", "o<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>O", "O<Esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

-- center the screen when jumping up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Use black hole register for change operations
vim.keymap.set("n", "c", '"_c', { desc = "Change without yanking" })
vim.keymap.set("n", "C", '"_C', { desc = "Change to end of line without yanking" })
vim.keymap.set("v", "c", '"_c', { desc = "Change selection without yanking" })
vim.keymap.set("v", "C", '"_C', { desc = "Change selection to end without yanking" })

-- Set up remaps for hjkl navigation in Insert mode
vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true })

-- Set up a custom hotkey for quitting Neovim
vim.api.nvim_set_keymap("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>dd", '"_dd')

-- Hop hotkeys
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "t", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
vim.keymap.set("", "S", function()
  hop.hint_char2()
end, { remap = true })

-- Copy filepath to clipboard
function insertFullPath()
  local filepath = vim.fn.expand("%")
  vim.fn.setreg("+", filepath) -- write to clippoard
end

vim.keymap.set("n", "<leader>yp", insertFullPath, { noremap = true, silent = true })
