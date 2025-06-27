return {
  -- Add nvim-lint plugin
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Configure custom CppCheck command with our naming convention checks
      lint.linters.cppcheck_custom = {
        cmd = "cppcheck",
        args = {
          "--enable=all",
          "--suppress=missingIncludeSystem",
          "--inline-suppr",
          "--xml",
          "--xml-version=2",
          "--addon=" .. os.getenv("HOME") .. "/.config/cppcheck/naming_convention.py",
          "--rule-file=" .. os.getenv("HOME") .. "/.config/cppcheck/custom_config.xml",
        },
        stdin = false,
        append_fname = true,
        stream = "stderr",
        parser = require("lint.parser").from_pattern(
          "^%[(.-):(.-)]%s+%((.-)%)%s+(.+):%s+(.+)$",
          { "file", "line", "severity", "message", "code" },
          {
            severities = {
              error = "error",
              warning = "warning",
              style = "info",
              performance = "info",
              portability = "info",
              information = "hint",
            },
          }
        ),
      }

      -- Set up linters for specific filetypes
      lint.linters_by_ft = {
        c = { "cppcheck_custom" },
        cpp = { "cppcheck_custom" },
      }

      -- Create autocmd to trigger linting
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
