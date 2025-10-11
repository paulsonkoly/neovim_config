local M = { _runners = {} }

local runner_names = { "go", "lua" }

for _, name in ipairs(runner_names) do
  M._runners[name] = require("run_code." .. name)
end

function M.Run()
  for _, runner in pairs(M._runners) do
    if runner.Match() then
      runner.Run()
      return
    end
  end
end

return M
