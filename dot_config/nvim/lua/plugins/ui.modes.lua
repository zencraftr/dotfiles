return {
	"mvllow/modes.nvim",
	event = "LazyFile",

	opts = {
		colors = {
			bg = "", -- Optional bg param, defaults to Normal hl group
			copy = "#f9e2af",
			delete = "#f38ba8",
			insert = "#a6e3a1",
			visual = "#cba6f7",
		},

		-- Set opacity for cursorline and number background
		line_opacity = 0.25,

		-- Enable cursor highlights
		set_cursor = true,

		-- Enable cursorline initially, and disable cursorline for inactive windows
		-- or ignored filetypes
		set_cursorline = true,

		-- Enable line number highlights to match cursorline
		set_number = true,

		-- Disable modes highlights in specified filetypes
		-- Please PR commonly ignored filetypes
		ignore = { "NvimTree", "TelescopePrompt" },
	},
}
