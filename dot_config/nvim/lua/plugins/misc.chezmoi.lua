return {
	"xvzc/chezmoi.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	event = "ChezmoiFile",

	opts = {
		edit = {
			watch = true,
			force = false,
		},
		events = {
			on_open = {
				notification = {
					msg = "Opened file",
					opts = { annote = "Chezmoi" },
				},
			},
			on_watch = {
				notification = {
					msg = "Watching file",
					opts = { annote = "Chezmoi" },
				},
			},
			on_apply = {
				notification = {
					msg = "Applied file",
					opts = { annote = "Chezmoi" },
				},
			},
		},
	},

	keys = {
		{
			"<leader>cm",
			mode = "n",
			function()
				require("modules.chezmoi"):picker()
			end,
			desc = "Chezmoi find files",
		},
	},
}
