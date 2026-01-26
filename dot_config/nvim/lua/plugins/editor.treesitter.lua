return {
	"nvim-treesitter/nvim-treesitter",

	event = "LazyFile",

	build = ":TSUpdate",

	opts = {
		ensure_installed = {
			"bash",
			"fish",
			"html",
			"latex",
			"lua",
			"markdown",
			"markdown_inline",
			"nix",
			"python",
			"yaml",
		},
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},

		indent = {
			enable = true,
		},

		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				node_incremental = "<CR>",
				scope_incremental = "<S-CR>",
				node_decremental = "<BS>",
			},
		},
	},
}
