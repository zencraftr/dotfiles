return {
	"j-hui/fidget.nvim",
	event = "VeryLazy",

	opts = {
		notification = {
			window = {
				winblend = 0,
				border = "rounded",
			},
			override_vim_notify = true,

			view = {
				group_separator = "",
			},
		},
	},

	keys = {
		{
			"<leader>nh",
			"<Cmd>Fidget history<Cr>",
			desc = "Notification history",
		},
		{
			"<leader>nc",
			"<Cmd>Fidget clear<Cr>",
			desc = "Notification clear",
		},
		{
			"<leader>nC",
			"<Cmd>Fidget clear_history<Cr>",
			desc = "Notification clear history",
		},
		{
			"<leader>nT",
			"<Cmd>Fidget suppress<Cr>",
			desc = "Notification toggle",
		},
		{
			"<leader>nt",
			"<Cmd>Fidget lsp_suppress<Cr>",
			desc = "Notification LSP toggle",
		},
	},
}
