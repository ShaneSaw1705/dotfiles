-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Set space as the leader key
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>L", ":Lazy<CR>", { noremap = true, silent = true, desc = "Run lazy" })

-- Key mappings for Normal mode
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true, silent = true, desc = "Run lazy" })
vim.api.nvim_set_keymap("n", "gh", "0", { noremap = true, silent = true, desc = "Run lazy" })

-- Key mappings for Visual mode
vim.api.nvim_set_keymap("v", "gl", "$", { noremap = true, silent = true, desc = "Run lazy" })
vim.api.nvim_set_keymap("v", "gh", "0", { noremap = true, silent = true, desc = "Run lazy" })
