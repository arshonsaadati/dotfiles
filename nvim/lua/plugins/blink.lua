return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-p>"] = {}, -- disable default
      ["<C-n>"] = {}, -- disable default
    },
  },
}
