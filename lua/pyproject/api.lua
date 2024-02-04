local curl = require("plenary.curl")

local M = {}

local DEFAULT_ENDPOINT = "https://pypi.org/pypi"
local JSON_DECODE_OPTS = { luanil = { object = true, array = true } }
local USER_AGENT = vim.fn.shellescape("pyproject.nvim (https://github.com/topenkoff/pyproject.nvim)")

local function parse_json(json_str)
  local json = vim.json.decode(json_str, JSON_DECODE_OPTS)
  if json and type(json) == "table" then
    return json
  end
end

local function fetch_dependency(name)
  local endpoint = DEFAULT_ENDPOINT
  local url = string.format("%s/%s/json", endpoint, name)
  local info = curl.request({
    url = url,
    method = "get",
    headers = { user_agent = USER_AGENT },
    timeout = 3000,
  }).body
  return info
end

function M.dependency_versions(name)
  local spec = parse_json(fetch_dependency(name))
  local versions={}
  for version, _ in pairs(spec.releases) do
    table.insert(versions, version)
  end
  return versions
end

function M.last_version(versions)
  return versions[#versions]
end

return M
