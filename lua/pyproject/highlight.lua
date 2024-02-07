local M = {}

local param = "guifg"
if not vim.o.termguicolors then
	param = "ctermfg"
end

local function register(group, color)
	local command = table.concat({ "highlight ", group, " ", param, "=", color })
	vim.cmd(command)
end

function M.apply()
  register(M.HIGHLIGHT_GROUPS.outdated, "#d19a66")
end

M.HIGHLIGHT_GROUPS = {
	outdated = "Outdated",
}


return M
