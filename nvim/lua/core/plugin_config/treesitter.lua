require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "swift", "lua", "rust", "vim","cpp", "python", "html" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}