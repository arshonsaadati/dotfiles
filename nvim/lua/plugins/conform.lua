return {
  "stevearc/conform.nvim",
  optional = true,
  opts = function(_, opts)
    -- Extend formatters_by_ft with your custom formatters
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.c = { "uncrustify" }
    opts.formatters_by_ft.cpp = { "uncrustify" }
    opts.formatters_by_ft.swift = { "swift_format" }

    -- Add your custom formatter configuration
    opts.formatters = opts.formatters or {}
    opts.formatters.uncrustify = {
      meta = {
        url = "https://github.com/uncrustify/uncrustify",
        description = "Code formatter for C, C++, etc.",
      },
      stdin = true,
      args = function(self, ctx)
        local filetype = ctx.buf and vim.bo[ctx.buf].filetype or "c"

        -- Notify when uncrustify is running
        vim.notify(
          string.format("🔧 Running uncrustify on %s file", filetype),
          vim.log.levels.INFO,
          { title = "Formatter", timeout = 2000 }
        )

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

        local config_path = vim.fn.expand("~/.config/uncrustify/uncrustify.cfg")
        if vim.fn.filereadable(config_path) == 0 then
          vim.notify("Uncrustify config file not found: " .. config_path, vim.log.levels.WARN)
        end

        return {
          "-l",
          lang,
          "-c",
          config_path,
          "--no-backup",
          "-q",
        }
      end,
    }
    opts.formatters.swift_format = {
      meta = {
        url = "https://github.com/swiftlang/swift-format",
        description = "Official Swift code formatter",
      },
      command = "swift-format",
      stdin = true,
      args = function(self, ctx)
        -- Notify when swift-format is running
        vim.notify(
          "⚡ Running swift-format on Swift file",
          vim.log.levels.INFO,
          { title = "Formatter", timeout = 2000 }
        )

        local args = {}
        local config_path = vim.fn.expand("~/.swift-format.json")

        if vim.fn.filereadable(config_path) == 1 then
          vim.list_extend(args, { "--configuration", config_path })
        end

        -- Add stdin filepath for better error reporting
        local filename = vim.api.nvim_buf_get_name(ctx.buf)
        if filename ~= "" then
          vim.list_extend(args, { "--stdin-filepath", filename })
        end

        return args
      end,
    }

    return opts
  end,
  init = function()
    -- Autocmd to show which formatters are being used on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("FormatterNotification", { clear = true }),
      callback = function(args)
        local conform = require("conform")
        local formatters = conform.list_formatters(args.buf)

        if #formatters > 0 then
          local formatter_names = {}
          for _, formatter in ipairs(formatters) do
            table.insert(formatter_names, formatter.name)
          end

          local filetype = vim.bo[args.buf].filetype
          vim.notify(
            string.format("📝 Formatting %s with: %s", filetype, table.concat(formatter_names, ", ")),
            vim.log.levels.INFO,
            { title = "Conform", timeout = 2000 }
          )
        end
      end,
    })
  end,
}
