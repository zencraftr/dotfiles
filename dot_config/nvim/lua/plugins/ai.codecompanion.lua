return {
	"olimorris/codecompanion.nvim",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
		"ravitemer/codecompanion-history.nvim",
	},

	opts = {
		interactions = {
			chat = {
				adapter = "copilot",
				roles = {
					llm = function(adapter)
						return "  " .. adapter.formatted_name
					end,
					user = " " .. vim.fn.getenv("USER"),
				},
			},
			inline = { adapter = "copilot" },
			cmd = { adapter = "copilot" },
		},

		-- Adapters settings
		adapters = {
			http = {
				anthropic = function()
					return require("codecompanion.adapters").extend("anthropic", {
						env = {
							api_key = vim.fn.getenv("ANTHROPIC_API_KEY"),
						},
					})
				end,
			},
			acp = {
				claude_code = function()
					return require("codecompanion.adapters").extend("claude_code", {
						env = {
							ANTHROPIC_API_KEY = vim.fn.getenv("ANTHROPIC_API_KEY"),
						},
						defaults = {
							model = "haiku",
						},
					})
				end,
			},
		},

		-- Display settings
		display = {
			chat = {
				auto_scroll = true,
				intro_message = "Welcome " .. vim.fn.getenv("USER") .. "! How can I assist you today?",
			},
		},

		-- Extension settings
		extensions = {
			history = {
				enabled = true,
				opts = {
					picker = "snacks",
				},
			},
		},
	},

	config = function(_, opts)
		require("codecompanion").setup(opts)
		require("modules.codecompanion-fidget"):init()
	end,

	keys = {
		{ "<leader>Cc", mode = "n", "<Cmd>CodeCompanionChat<Cr>", desc = "AI CodeCompanion open chat" },
		{ "<leader>Ct", mode = "n", "<Cmd>CodeCompanionChat Toggle<Cr>", desc = "AI CodeCopanion toggle chat" },
		{ "<leader>Ca", mode = "n", "<Cmd>CodeCompanionActions<Cr>", desc = "AI CodeCompanion actions" },

		{ "<leader>Ch", mode = "n", "<Cmd>CodeCompanionHistory<Cr>", desc = "AI CodeCompanion chats history" },
	},
}
