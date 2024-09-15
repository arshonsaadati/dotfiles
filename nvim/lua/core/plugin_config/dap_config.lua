require("dapui").setup()
require("nvim-dap-virtual-text").setup()
require("dap-python").setup("python")

local dap, dapui, daptext = require("dap"), require("dapui"), require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
vim.keymap.set("n", "<Leader>dc", ':DapContinue<CR>')
vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')
