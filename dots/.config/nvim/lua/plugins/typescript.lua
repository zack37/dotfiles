return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        root_dir = function()
          local lazyvimRoot = require("lazyvim.util.root")
          return lazyvimRoot.git()
        end,
        settings = {
          typescript = {
            tsdk = ".yarn/sdks/typescript/lib"
          }
        }
      }
    }
  }
}
