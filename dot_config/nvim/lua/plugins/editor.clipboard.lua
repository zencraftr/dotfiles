return {
	-- 	dir = "~/Projects/neovim-plugins/clipboard",
	-- 	name = "clipboard.nvim",
	"zencraftr/clipboard.nvim",

	dependencies = {
		"folke/snacks.nvim",
	},

	opts = {
		-- Your configuration comes here or leave it empty to use the default settings.
		picker = "snacks",
	},

	keys = {
		{ "<leader>yy", "<cmd>ClipboardHistory<cr>", desc = "Yank history to clipboard" },
		{ "<leader>yi", "<cmd>ClipboardInsert<cr>", desc = "Insert history" },
	},
}
