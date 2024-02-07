local core = require("pyproject.core")
local highlight = require("pyproject.highlight")

local function setup()
  --if vim.fn.expand("%:t") == "pyproject.toml" then
  highlight.apply()
	core.show()
  --end
end

local M = {
  setup = setup,
}

return M
