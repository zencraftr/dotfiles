local lualine = require("modules.lualine")

return {
	"nvim-lualine/lualine.nvim",

	event = "LazyFile",

	dependencies = {
		"echasnovski/mini.icons",
	},

	opts = {
		enabled = true,
		options = {
			theme = "catppuccin",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
		sections = {

			-- Vim Mode
			lualine_a = {
				{
					"mode",
					icon = "",
					separator = { left = "", right = "" },
				},
			},

			-- Cursor location
			lualine_b = {
				{
					lualine.cursor,
					color = { fg = lualine.palette["subtext1"], bg = lualine.palette["surface0"] },
					padding = { left = 1, right = 0 },
				},
			},

			-- Disable section C
			lualine_c = { {} },

			-- LSP Status
			lualine_x = {
				{
					"lsp_status",
					icon = "",
					symbols = {
						done = "",
					},
					ignore_lsp = { "null-ls", "copilot" },
					color = function()
						return {
							fg = lualine.palette["green"],
							bg = lualine.palette["base"],
							gui = "bold",
						}
					end,
					on_click = function()
						vim.cmd("checkhealth vim.lsp")
					end,
				},
			},

			-- Current file
			lualine_y = {
				{
					lualine.file,
					color = { fg = lualine.palette["base"], bg = lualine.palette["maroon"], gui = "bold" },
					separator = { left = "" },
				},
			},

			-- Current working directory
			lualine_z = {
				{
					lualine.cwd,
					color = { fg = lualine.palette["base"], bg = lualine.palette["rosewater"], gui = "bold" },
					separator = { left = "", right = "" },
				},
			},
		},
	},

	keys = {
		{
			"<leader>tl",
			function()
				lualine:toggle()
			end,
			desc = "Toggle Lualine",
		},
	},
}
