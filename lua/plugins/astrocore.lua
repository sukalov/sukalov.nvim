-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {
        ["ол"] = { "<Esc>" },
        ["оо"] = { "<Esc>" },
      },
      n = {
        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        ["<Leader>o"] = false,

        ["<Leader>ac"] = { "<cmd>Augment chat<CR>", desc = "Augment chat" },
        ["<Leader>an"] = { "<cmd>Augment chat-new<CR>", desc = "Start new chat" },
        ["<Leader>at"] = { "<cmd>Augment chat-toggle<CR>", desc = "Toggle chat panel" },

        -- OpenCode mappings
        ["<leader>oA"] = { function() require("opencode").ask() end, desc = "Ask opencode" },
        ["<leader>oa"] = { function() require("opencode").ask "@cursor: " end, desc = "Ask opencode about this" },
        ["<leader>ot"] = { function() require("opencode").toggle() end, desc = "Toggle embedded opencode" },
        ["<leader>to"] = { function() require("opencode").toggle() end, desc = "Toggle embedded opencode" },
        ["<leader>on"] = { function() require("opencode").command "session.new" end, desc = "New session" },
        ["<leader>oy"] = { function() require("opencode").command "session.share" end, desc = "Share session" },
        ["<S-C-u>"] = { function() require("opencode").command "session.half.page.up" end, desc = "Scroll messages up" },
        ["<S-C-d>"] = { function() require("opencode").command "session.half.page.down" end, desc = "Scroll messages down" },
        ["<leader>op"] = { function() require("opencode").select() end, desc = "Select prompt" },
        ["<leader>oe"] = { function() require("opencode").prompt "explain" end, desc = "Explain code near cursor" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      v = {
        ["<Leader>ac"] = { "<cmd>Augment chat<CR>", desc = "Augment chat" },
        ["<leader>oa"] = { function() require("opencode").ask "@selection: " end, desc = "Ask opencode about selection" },
        ["<leader>op"] = { function() require("opencode").select() end, desc = "Select prompt" },
      },
    },
  },
}
