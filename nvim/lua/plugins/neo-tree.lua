return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "<C-n>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<C-N>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<C-n>", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    { "<C-N>", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
  },
}
