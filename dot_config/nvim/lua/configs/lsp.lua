-- Virtual lines
vim.diagnostic.config({
	virtual_text = {
		severity = {
			min = "INFO",
			max = "WARN",
		},
	},
	virtual_lines = {
		severity = {
			min = "ERROR",
		},
	},
	severity_sort = true,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("nil_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("rust_analyzer")

-- WebDev LSPs (vscode-langservers-extracted)
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("eslint")
vim.lsp.enable("jsonls")
