return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      -- Add sourcekit to the list of servers
      opts.servers.sourcekit = {
        -- Your SourceKit configuration
        root_dir = function(filename)
          local util = require("lspconfig.util")
          if filename:match("%.swift$") or filename:match("Package%.swift") then
            return util.root_pattern("buildServer.json")(filename)
              or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
              or util.find_git_ancestor(filename)
              or util.root_pattern("Package.swift")(filename)
              or util.root_pattern("*.swift")(filename)
              or util.path.dirname(filename)
          end
        end,
      }

      -- LazyVim will automatically handle the capabilities
      -- No need to set them manually
    end,
  },
}
