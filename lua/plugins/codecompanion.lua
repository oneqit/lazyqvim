return {
  {
    "olimorris/codecompanion.nvim",
    config = function()
      local codecompanion = require("codecompanion")
      codecompanion.setup({
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              name = "ollama",
              env = {
                url = "http://localhost:11434",
                -- api_key = "OLLAMA_API_KEY",
              },
              headers = {
                ["Content-Type"] = "application/json",
                -- ["Authorization"] = "Bearer ${api_key}",
              },
              parameters = {
                sync = true,
              },
            })
          end,
        },
      })
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "ollama",
        },
      },
      opts = {
        -- Set debug logging
        log_level = "DEBUG",
      },
    },
  },
}
