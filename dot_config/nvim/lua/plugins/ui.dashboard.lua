return {
	"nvimdev/dashboard-nvim",
	name = "dashboard.nvim",

	dependencies = {
		"echasnovski/mini.icons",
	},

	event = "VimEnter",

	opts = {
		theme = "hyper",
		disable_move = true,
		shortcut_type = "number",
		config = {
			header = {
				[[                                                                       ]],
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
				[[                                                                       ]],
			},
			shortcut = {
				{
					icon = "󰏔 ",
					desc = "Plugins",
					group = "Number",
					action = "Lazy",
					{ enable = true }, -- show how many plugi
					key = "L",
				},
				{
					icon = " ",
					desc = "Files",
					group = "Label",
					action = function()
						Snacks.picker.files()
					end,
					key = "f",
				},
				{
					icon = " ",
					desc = "Recent Files",
					group = "Label",
					action = function()
						Snacks.picker.recent()
					end,
					key = "r",
				},
				{
					icon = " ",
					desc = "Projects",
					group = "Label",
					action = function()
						Snacks.picker.projects()
					end,
					key = "p",
				},
				{
					icon = " ",
					desc = "Chezmoi Files",
					group = "Label",
					action = function()
						require("modules.chezmoi"):picker()
					end,
					key = "c",
				},
			},
			project = {
				action = function(path)
					Snacks.picker.files({
						title = "Project Files (" .. path .. ")",
						cwd = path,
					})
				end,
			},
			footer = {},
		},
	},
}
