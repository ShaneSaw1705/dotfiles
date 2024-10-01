vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"

-- Optionally, set the `termguicolors` for better color support
vim.opt.termguicolors = true

-- Set space as the leader key
vim.g.mapleader = "<Space>"

-- -- Split window vertically with <Leader>v
require("config.lazy")
