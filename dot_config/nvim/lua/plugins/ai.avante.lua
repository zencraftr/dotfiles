return {
	"yetone/avante.nvim",
	version = false,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},

	build = "make",

	---@module 'avante'
	---@type avante.Config
	opts = {
		instructions_file = "avante.md",

		-- Proveider configuration
		---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
		---@type Provider
		provider = "copilot",
		providers = {
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-haiku-4-5-20251001",
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 4096,
				},
			},
		},

		-- Bahaviour configuration
		behaviour = {
			auto_set_keymaps = false,
			support_paste_from_clipboard = true,
			confirmation_ui_style = "popup",
		},

		-- UI configuration
		windows = {
			width = 50,
			input = {
				prefix = " ",
				-- Height of the Avante input window
				height = 8,
			},
			edit = {
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			},
		},

		selector = {
			---@alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
			---@type avante.SelectorProvider
			provider = "snacks",
		},
		input = {
			provider = "snacks",
		},
	},

	keys = {
		{
			"<leader>aa",
			mode = "n",
			"<cmd>AvanteAsk<cr>",
			desc = "Ask avante",
		},
		{
			"<leader>ac",
			mode = "n",
			"<cmd>AvanteChat<cr>",
			desc = "Avante chat",
		},
		{
			"<leader>an",
			mode = "n",
			"<cmd>AvanteChatNew<cr>",
			desc = "Avante new chat",
		},
		{
			"<leader>aC",
			mode = "n",
			"<cmd>AvanteClear<cr>",
			desc = "Avante clear chat",
		},
		{
			"<leader>am",
			mode = "n",
			"<cmd>AvanteModels<cr>",
			desc = "Avante models",
		},
		{
			"<leader>ab",
			mode = "n",
			"<cmd>AvanteBuild<cr>",
			desc = "Avante build",
		},
		{
			"<leader>af",
			mode = "n",
			"<cmd>AvanteFocus<cr>",
			desc = "Avante focus",
		},
		{
			"<leader>ae",
			mode = "n",
			"<cmd>AvanteEdit<cr>",
			desc = "Avante inline edit",
		},
		{
			"<leader>ah",
			mode = "n",
			"<cmd>AvanteHistory<cr>",
			desc = "Avante chat history",
		},

		{
			"<leader>ar",
			mode = "n",
			"<cmd>AvanteRefresh<cr>",
			desc = "Avante refresh",
		},
		{
			"<leader>as",
			mode = "n",
			"<cmd>AvanteStop<cr>",
			desc = "Avante stop",
		},
	},
}
