-- Cross-platform theme loader
-- On omarchy Linux: loads theme from external omarchy config
-- On macOS: returns empty table (uses LazyVim defaults)
local omarchy_theme = "/home/sukalov/.config/omarchy/current/theme/neovim.lua"

if vim.fn.filereadable(omarchy_theme) == 1 then
	return dofile(omarchy_theme)
end

return {}
