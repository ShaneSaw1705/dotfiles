vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars:append({ eob = " " })
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.signcolumn = "yes:1"
vim.opt.backupcopy = "yes"

vim.fn.setenv("DOTNET_ROOT", "/usr/local/share/dotnet")
vim.fn.setenv("MSBuildSDKsPath", "/usr/local/share/dotnet/sdk/8.0.303/Sdks")

vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.laststatus = 3

require("config.keymaps")
require("config.lazy")
