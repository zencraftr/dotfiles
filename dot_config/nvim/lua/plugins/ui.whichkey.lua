return {
	"folke/which-key.nvim",

	dependencies = {
		"echasnovski/mini.icons",
	},

	event = "VeryLazy",

	opts = {
		win = {
			border = "single",
		},
		icons = {
			group = " ",
		},
		spec = {
			{ "<leader>a", group = "Avante" },
			{ "<leader>c", group = "Claude" },
			{ "<leader>C", group = "CodeCompanion" },
			{ "<leader>e", group = "File Explorer" },
			{ "<leader>f", group = "Find" },
			{ "<leader>fg", group = "Grep" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gh", group = "GitHub" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>lw", group = "Workspace" },
			{ "<leader>n", group = "Notifications" },
			{ "<leader>s", group = "Sessions & Splits" },
			{ "<leader>t", group = "Toggle" },
		},
	},
}
