vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars:append({ eob = " " })

-- neovide config
if vim.g.neovide then
	vim.o.guifont = "JetbrainsMono Nerd Font:h12"
	-- local alpha = function()
	-- 	return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	-- end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	-- vim.g.neovide_transparency = 0.0
	-- vim.g.transparency = 0.8
	-- vim.g.neovide_background_color = "#0f1117" .. alpha()
	vim.g.neovide_window_blurred = true
	vim.g.neovide_scroll_animation_length = 0.2
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_refresh_rate = 60
	vim.g.neovide_cursor_trail_size = 0.3
	vim.g.neovide_show_border = false
end

-- Optionally, set the `termguicolors` for better color support
vim.opt.termguicolors = true

-- Set space as the leader key
vim.g.mapleader = "<Space>"

-- -- Split window vertically with <Leader>v
require("config.lazy")
