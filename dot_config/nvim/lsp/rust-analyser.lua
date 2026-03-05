vim.lsp.config("rust_analyzer", {
	-- Server settings
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
		},
	},
})
