local M = {}

function M:toggle()
	-- Use Neovim `laststaus` option (https://neovim.io/doc/user/options.html#'laststatus')

	if vim.o.laststatus ~= 0 then
		vim.opt.laststatus = 0
		vim.notify("Statusline disabled", vim.log.levels.INFO, { annote = "Lualine" })
	else
		vim.opt.laststatus = 3
		vim.notify("Lualine enabled", vim.log.levels.INFO, { annote = "Lualine" })
	end
end

M.palette = require("catppuccin.palettes").get_palette("mocha")

function M:cwd()
	return "󰉖 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

function M:file()
	local icon = MiniIcons.get("filetype", vim.bo.filetype)

	-- Hardcoded filetypes (Remember to add the icon to mini.icons)
	if vim.bo.filetype == "codecompanion" then
		return icon .. "codecompanion"
	elseif vim.bo.filetype == "Avante" then
		return " " .. "Avante"
	elseif vim.bo.filetype == "AvanteInput" then
		return " " .. "Avante"
	elseif vim.bo.filetype == "AvanteSelectedFiles" then
		return " " .. "Avante"
	end

	-- Get file icon and name
	return icon .. " " .. vim.fn.expand("%:t")
end

function M:cursor()
	local progress = math.floor((tonumber(vim.fn.line(".")) / tonumber(vim.fn.line("$"))) * 100)
	local location = vim.fn.line(".") .. ":" .. vim.fn.col(".")
	return progress .. "%% " .. location
end

return M
