return {
	"coder/claudecode.nvim",

	dependencies = { "folke/snacks.nvim" },

	config = true,

	keys = {
		{ "<leader>co", "<cmd>ClaudeCodeOpen<cr>", desc = "Open Claude" },
		{ "<leader>cc", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{ "<leader>cS", "<cmd>ClaudeCodeStart<cr>", mode = "n", desc = "Start Claude" },
		{ "<leader>cs", "<cmd>ClaudeCodeStop<cr>", mode = "n", desc = "Stop Claude" },
		-- Diff management
		{ "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
