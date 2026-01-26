return {
	"saghen/blink.cmp",
	version = "1.*",

	event = "InsertEnter",

	dependencies = {
		"rafamadriz/friendly-snippets",
		{ "Kaiser-Yang/blink-cmp-avante", name = "blnk-avante.cmp" },
	},

	---@module "blink_cmp"
	---@type blink.cmp.Config
	opts = {
		completion = {
			documentation = {
				auto_show = true,
			},
			menu = {
				draw = {
					columns = {
						{ "kind_icon", "label", "label_description", gap = 1 },
					},
				},
			},
		},

		signature = {
			enabled = true,
		},

		sources = {
			default = {
				"buffer",
				"cmdline",
				"lsp",
				"snippets",
				"path",
				"avante",
			},
			per_filetype = {
				codecompanion = { "codecompanion" },
				lua = { inherit_defaults = true, "lazydev" },
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
				},
			},
		},

		fuzzy = {
			implementation = "rust",
		},

		keymap = {
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },

			["<CR>"] = { "accept", "fallback" },
			["<ESC>"] = { "hide", "fallback" },

			["<C-h>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},
	},

	opts_extend = {
		"sources.default",
	},
}
