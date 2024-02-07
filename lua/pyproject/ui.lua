local highlight = require("pyproject.highlight")

local PYPROJECT_NS = vim.api.nvim_create_namespace("pyproject.nvim")
-- local DIAGNOSTIC_NS = vim.api.nvim_create_namespace("pyproject.nvim.diagnostic")

local M = {}

function M.clear(buf)
    vim.api.nvim_buf_clear_namespace(buf, PYPROJECT_NS, 0, -1)
    vim.diagnostic.reset(CUSTOM_NS, buf)
    -- vim.diagnostic.reset(DIAGNOSTIC_NS, buf)
end

function M.display_loading(buf, dep)
  vim.api.nvim_buf_clear_namespace(buf, PYPROJECT_NS, 0, -1)

  local vers_line = dep.line
  local virt_text = { { dep.version, highlight.HIGHLIGHT_GROUPS.outdated } }
  vim.api.nvim_buf_set_extmark(buf, PYPROJECT_NS, vers_line, -1, {
      virt_text = virt_text,
      virt_text_pos = "eol",
      hl_mode = "combine",
  })
end

return M
