local api = require("pyproject.api")
local toml = require("pyproject.toml")
local ui = require("pyproject.ui")

local function show()
  local bufname = vim.api.nvim_buf_get_name(0)
  local pyproject_toml = string.match(bufname, "pyproject.toml$")
  if not pyproject_toml then
    return
  end
  local buf = vim.api.nvim_get_current_buf()

  ui.clear(buf)

  local dep = {
    version = "1.1.1",
    line = 13,
  }

  ui.display_loading(buf, dep)
end

local M = {
  show = show
}

return M
