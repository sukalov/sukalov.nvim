return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  cmd = { "SupermavenUseFree", "SupermavenUsePro" },
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              local suggestion = require "supermaven-nvim.completion_preview"
              if suggestion.has_suggestion() then
                vim.schedule(function() suggestion.on_accept_suggestion() end)
                return true
              end
            end,
          },
        },
      },
    },
  },
}
