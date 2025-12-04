-- Override AstroNvim's default <leader>o mapping for OpenCode
return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    local maps = opts.mappings
    if not maps.n then maps.n = {} end
    
    -- Disable AstroNvim's neo-tree <leader>o mapping
    maps.n["<Leader>o"] = false
    
    -- Add explorer mapping to <leader>e
    maps.n["<Leader>e"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" }
  end,
}