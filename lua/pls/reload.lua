local function file_exists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end

-- /something/something/lua/x/y/z.lua -> x
-- /something/something/lua/x/init.lua -> x
local function module_name()
  local buf_name = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
  buf_name = vim.fs.normalize(buf_name)

  local _, _, top_module = buf_name:find("/lua/([^/]*)/.*[.]lua")

  return top_module
end

local function reload()
  local mod = module_name()
  for candidate, _ in pairs(package.loaded) do
    if candidate:match(mod) then
      print("removing ", candidate)
      package.loaded[candidate] = nil
    end
  end
  print("loading ", mod)
  local req = require(mod)
  local plug = vim.fn.stdpath("config") .. "/after/plugin/" .. mod .. ".lua"
  if file_exists(plug) then
    print("sourcing ", plug)
    vim.cmd("source " .. plug)
  end
  return req
end

return reload
