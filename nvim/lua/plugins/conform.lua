return {
  -- Override the default conform configuration
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      -- Add uncrustify to the list of formatters
      formatters_by_ft = {
        c = { "uncrustify" },
        cpp = { "uncrustify" },
      },

      -- Configure uncrustify with your custom config and specify language
      formatters = {
        uncrustify = {
          meta = {
            url = "https://github.com/uncrustify/uncrustify",
            description = "Code formatter for C, C++, etc.",
          },
          stdin = true,
          args = function(self, ctx)
            local filetype = ctx.buf and vim.bo[ctx.buf].filetype or ""
            local lang_map = {
              c = "C",
              cpp = "CPP",
              cs = "CS", -- C#
              java = "JAVA",
              vala = "VALA",
              d = "D",
              pawn = "PAWN",
              objc = "OC", -- Objective-C
              objcpp = "OC+", -- Objective-C++
            }
            local lang = lang_map[filetype] or "C"

            return {
              "-l",
              lang,
              "-c",
              vim.fn.expand("~/.config/uncrustify/uncrustify.cfg"),
              "--no-backup",
              "-q", -- quiet mode
            }
          end,
        },
      },
    },
  },
}
