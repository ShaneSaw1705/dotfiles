return {
	"nvim-tree/nvim-web-devicons",
	opts = {
		color_icons = true,
		default = true,
		strict = true,
	},
	config = function()
		-- Define a function to set highlight groups for mode and git
		local function set_highlights()
			-- Get the current theme's primary color (StatusLine highlight group)
			local statusline_hl = vim.api.nvim_get_hl_by_name("StatusLine", true)
			local primary_bg = statusline_hl.bg or "White" -- Fallback to White if no bg is set

			-- Set highlights for mode and git
			vim.cmd(string.format("hi StatusLineMode guibg=%s guifg=Black", primary_bg))
			vim.cmd("hi StatusLineGit guibg=#444444 guifg=White")
		end

		-- Define a mapping for modes
		local mode_map = {
			n = "NORMAL",
			i = "INSERT",
			v = "VISUAL",
			V = "VL",
			[""] = "VB",
			c = "COMMAND",
			R = "R",
			t = "TERMINAL",
		}

		-- Function to get current mode
		local function get_mode()
			local mode = vim.fn.mode()
			return "%#StatusLineMode# " .. (mode_map[mode] or mode) .. " %#StatusLine#"
		end

		-- Function to get the current Git branch
		local function get_git_branch()
			local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):gsub("\n", "")
			if is_git_repo ~= "true" then
				return "%#StatusLineGit# NO REPO %#StatusLine#"
			end

			local branch = vim.fn.system("git branch --show-current 2>/dev/null"):gsub("\n", "")
			if branch ~= "" then
				local git_icon = require("nvim-web-devicons").get_icon("git", "git", { default = true }) or ""
				return "%#StatusLineGit# " .. git_icon .. " " .. branch .. " %#StatusLine#"
			end

			return ""
		end

		-- Function to get the file icon and name
		local function get_file_icon_and_name()
			local filename = vim.fn.expand("%:t")
			if filename == "" then
				return ""
			end

			local extension = vim.fn.expand("%:e")
			local icon = require("nvim-web-devicons").get_icon(filename, extension, { default = true }) or ""
			return "%#StatusLine# " .. icon .. " " .. filename .. "  %#StatusLine#"
		end

		-- Function to set the statusline
		local function set_statusline()
			local statusline = {
				function()
					return get_mode()
				end,
				function()
					return get_git_branch()
				end,
				"%=",
				function()
					return get_file_icon_and_name()
				end,
				"%=",
				"%r",
				"%m",
				" %3l:%-2c ",
			}
			vim.o.statusline = table.concat(
				vim.tbl_map(function(item)
					return type(item) == "function" and item() or item
				end, statusline),
				""
			)
		end

		-- Create autocommands to update the statusline on mode change and when git status might change
		vim.api.nvim_create_autocmd({ "ModeChanged", "BufEnter", "FocusGained" }, {
			callback = set_statusline,
		})

		-- Set an autocommand to run the highlight setup after the colorscheme is applied
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = set_highlights,
		})

		-- Set initial statusline
		set_statusline()

		-- Optional: Run your highlight function when the plugin loads, in case a colorscheme is already set
		set_highlights()
	end,
}
