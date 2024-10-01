return {
	"rose-pine/neovim",
	config = function()
		require("rose-pine").setup({
			variant = "auto", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},

			groups = {
				border = "muted",
				link = "iris",
				panel = "surface",

				error = "love",
				hint = "iris",
				info = "foam",
				note = "pine",
				todo = "rose",
				warn = "gold",

				git_add = "foam",
				git_change = "rose",
				git_delete = "love",
				git_dirty = "rose",
				git_ignore = "muted",
				git_merge = "iris",
				git_rename = "pine",
				git_stage = "iris",
				git_text = "rose",
				git_untracked = "subtle",

				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
		})

		-- vim.cmd("colorscheme rose-pine")
		vim.cmd("colorscheme rose-pine-main")
		-- vim.cmd("colorscheme rose-pine-moon")
		-- vim.cmd("colorscheme rose-pine-dawn")
	end,
}

-- Custom monotone theme
-- return {
-- 	"jesseleite/nvim-noirbuddy",
-- 	dependencies = {
-- 		"tjdevries/colorbuddy.nvim",
-- 	},
-- 	priority = 1000,
-- 	config = function()
-- 		require("noirbuddy").setup({
-- 			preset = "minimal",
-- 			styles = {
-- 				italic = true,
-- 				bold = true,
-- 				underline = true,
-- 				undercurl = true,
-- 			},
-- 			colors = {
-- 				background = "#1a1a1a", -- #151515 brightened
-- 				primary = "#7d7d7d", -- #6a6a6a brightened
-- 				secondary = "#ffffff", -- no change
-- 				noir_0 = "#f8f8f8", -- #f7f7f7 brightened
-- 				noir_1 = "#f1f1f1", -- #f0f0f0 brightened
-- 				noir_2 = "#8b8b8b", -- #787878 brightened
-- 				noir_3 = "#c3c3c3", -- #b8b8b8 brightened
-- 				noir_4 = "#757575", -- #646464 brightened
-- 				noir_5 = "#5e5e5e", -- #4f4f4f brightened
-- 				noir_6 = "#5e5e5e", -- #4f4f4f no change
-- 				noir_7 = "#5e5e5e", -- #4f4f4f no change
-- 				noir_8 = "#484848", -- #404040 brightened
-- 				noir_9 = "#232323", -- #1c1c1c brightened
-- 			},
-- 		})
--
-- 		-- Tokens colors
-- 		vim.cmd("highlight @variable guifg=#ffffff") -- no change
-- 		vim.cmd("highlight @variable.builtin guifg=#ffffff") -- no change
-- 		vim.cmd("highlight @variable.member guifg=#8b8b8b") -- #787878 brightened
--
-- 		vim.cmd("highlight @constant guifg=#a1a1a1") -- #888888 brightened
--
-- 		vim.cmd("highlight @keyword guifg=#666666") -- #555555 brightened
-- 		vim.cmd("highlight @keyword.operator guifg=#757575") -- #646464 brightened
-- 		vim.cmd("highlight @keyword.function guifg=#8b8b8b") -- #787878 brightened
-- 		vim.cmd("highlight @keyword.return guifg=#8b8b8b") -- #787878 brightened
--
-- 		vim.cmd("highlight @punctuation.bracket guifg=#757575") -- #646464 brightened
--
-- 		vim.cmd("highlight @constructor guifg=#bbbbbb") -- #999999 brightened
--
-- 		vim.cmd("highlight @operator guifg=#666666") -- #555555 brightened
-- 		vim.cmd("highlight @comment guifg=#bbbbbb") -- #999999 brightened
-- 		vim.cmd("highlight @string guifg=#666666") -- #555555 brightened
--
-- 		vim.cmd("highlight @keyword.coroutine guifg=#666666") -- #555555 brightened
--
-- 		vim.cmd("highlight @function.builtin guifg=#cccccc") -- #b3b3b3 brightened
-- 		vim.cmd("highlight @function.call guifg=#cccccc") -- #b3b3b3 brightened
-- 		vim.cmd("highlight @function.method.call guifg=#cccccc") -- #b3b3b3 brightened
--
-- 		vim.cmd("highlight @tag guifg=#bbbbbb") -- #999999 brightened
-- 		vim.cmd("highlight @tag.delimiter guifg=#bbbbbb") -- #999999 brightened
-- 		vim.cmd("highlight @tag.attribute guifg=#666666") -- #555555 brightened
--
-- 		vim.cmd("highlight @lsp.type.parameter guifg=#cccccc gui=italic") -- #b3b3b3 brightened
--
-- 		vim.cmd("highlight @type guifg=#f1f1f1") -- #f0f0f0 brightened
-- 		vim.cmd("highlight @type.qualifier guifg=#666666") -- #555555 brightened
--
-- 		-- Vim command line error colors
-- 		vim.cmd("highlight ErrorMsg guifg=#666666 guibg=#ff8989") -- #555555 brightened
--
-- 		-- NvimTree colors
-- 		vim.cmd("highlight NvimTreeFolderIcon guifg=#757575") -- #646464 brightened
-- 		vim.cmd("highlight NvimTreeFolderName guifg=#cccccc") -- #b3b3b3 brightened
-- 		vim.cmd("highlight NvimTreeFileIcon guifg=#666666") -- #555555 brightened
-- 		vim.cmd("highlight NvimTreeFileName guifg=#666666") -- #555555 brightened
-- 		vim.cmd("highlight NvimTreeIndentMarker guifg=#3a3a3a") -- #2e2e2e brightened
-- 		vim.cmd("highlight NvimTreeNormal guibg=NONE guifg=#757575") -- #646464 brightened
-- 		vim.cmd("highlight NvimTreeVertSplit guibg=NONE guifg=NONE")
--
-- 		vim.cmd("highlight NvimTreeCursorLine guibg=#232323 guifg=NONE gui=bold") -- #1c1c1c brightened
--
-- 		vim.cmd("highlight NvimTreeGitDirty guifg=#f2e89b") -- #f0c674 brightened
-- 		vim.cmd("highlight NvimTreeGitNew guifg=#c3e8c3") -- #b1d5b6 brightened
-- 		vim.cmd("highlight NvimTreeGitStaged guifg=#b0e7fc") -- #9be3fc brightened
-- 		vim.cmd("highlight NvimTreeGitUnstaged guifg=#d2f0fc") -- #c0e7fa brightened
-- 		vim.cmd("highlight NvimTreeGitUntracked guifg=#f2e89b") -- #f0c674 brightened
-- 		vim.cmd("highlight NvimTreeGitRenamed guifg=#f5ff9c") -- #f3ff9c brightened
-- 		vim.cmd("highlight NvimTreeGitIgnored guifg=#484848") -- #404040 brightened
-- 		vim.cmd("highlight NvimTreeGitMerge guifg=#d1b9f9") -- #bda1f9 brightened
-- 		vim.cmd("highlight NvimTreeGitModified guifg=#d2f0fc") -- #c0e7fa brightened
-- 		vim.cmd("highlight NvimTreeGitDeleted guifg=#ffb9b9") -- #ff9b9b brightened
-- 		vim.cmd("highlight NvimTreeWinSeparator guibg=NONE guifg=#1a1a1a") -- #151515 brightened
--
-- 		-- Diagnostic colors
-- 		vim.cmd("highlight DiagnosticError guifg=#ffb9b9") -- #ff9b9b brightened
-- 		vim.cmd("highlight DiagnosticWarn guifg=#f2e89b") -- #f0c674 brightened
-- 		vim.cmd("highlight DiagnosticInfo guifg=#b0e7fc") -- #9be3fc brightened
-- 		vim.cmd("highlight DiagnosticHint guifg=#c3e8c3") -- #b1d5b6 brightened
--
-- 		-- Diagnostic signs colors
-- 		vim.cmd("highlight DiagnosticSignError guifg=#ffb9b9") -- #ff9b9b brightened
-- 		vim.cmd("highlight DiagnosticSignWarn guifg=#f2e89b") -- #f0c674 brightened
-- 		vim.cmd("highlight DiagnosticSignInfo guifg=#b0e7fc") -- #9be3fc brightened
-- 		vim.cmd("highlight DiagnosticSignHint guifg=#c3e8c3") -- #b1d5b6 brightened
--
-- 		-- Editor transparent colors
-- 		vim.cmd("highlight Normal guibg=none")
-- 		vim.cmd("highlight NonText guibg=none")
-- 		vim.cmd("highlight Normal ctermbg=none")
-- 		vim.cmd("highlight NonText ctermbg=none")
--
-- 		vim.cmd("highlight clear LineNr")
-- 		vim.cmd("highlight clear SignColumn")
--
-- 		-- LSP colors
-- 		vim.cmd("highlight FloatBorder guibg=NONE guifg=#3a3a3a") -- #2e2e2e brightened
-- 		vim.cmd("highlight FloatShadow guibg=NONE guifg=NONE")
-- 		vim.cmd("highlight FloatShadowThrough guibg=NONE guifg=NONE")
--
-- 		-- Visual mode colors
-- 		vim.cmd("highlight Visual guibg=#242424 guifg=NONE") -- #1f1f1f brightened
--
-- 		-- Numbers Gutter
-- 		vim.cmd("highlight GitSignsAdd guifg=#7a7a7a") -- #6a6a6a brightened
-- 		vim.cmd("highlight GitSignsChange guifg=#a7a7a7") -- #979797 brightened
-- 		vim.cmd("highlight GitSignsDelete guifg=#ff7272") -- #ff5858 brightened
-- 	end,
-- }
