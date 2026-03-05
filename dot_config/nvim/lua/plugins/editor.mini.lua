return {
	{
		"echasnovski/mini.ai",
		version = "*", -- stable release

		event = "LazyFile",

		opts = function()
			local ai = require("mini.ai")
			return {
				custom_textobjects = {
					-- adds iB/aB (bracket)
					s = { "%[%[().-()%]%]" },
					-- adds iF/aF (function)
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
					-- adds ic/ac (class)
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
					-- adds io/ao (code block)
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
				},
			}
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*", -- stable release

		event = "LazyFile",

		opts = {},
	},
	{
		"echasnovski/mini.comment",
		version = "*", -- stable release

		event = "LazyFile",

		opts = {},
	},
	{
		"echasnovski/mini.pairs",
		version = "*", -- stable release

		event = "InsertEnter",

		opts = {
			modes = {
				insert = true,
				command = true,
				terminal = false,
			},
		},
	},
	{
		"echasnovski/mini.hipatterns",
		version = "*", -- stable release

		event = "LazyFile",

		opts = function()
			local hipatterns = require("mini.hipatterns")
			return {
				highlighters = {

					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			}
		end,
	},
	{
		"echasnovski/mini.icons",
		version = "*", -- stable release
		lazy = true,

		opts = {
			filetype = {
				codecompanion = { glyph = " ", hl = "MiniIconsRed" },
				avante = { glyph = " ", hl = "MiniIconsBlue" },
				claudecode = { glyph = " ", hl = "MiniIconsOrange" },
			},
		},

		config = function(_, opts)
			require("mini.icons").setup(opts)
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
}
