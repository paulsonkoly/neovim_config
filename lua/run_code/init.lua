local M = { _runners = {} }

local runner_names = { "go", "lua", "calc" }

for _, name in ipairs(runner_names) do
  M._runners[name] = require("run_code." .. name)
end

function M.Run()
  for _, runner in pairs(M._runners) do
    if runner.Match() then
      vim.api.nvim_command(":w")
      runner.Run()
      return
    end
  end
end

return M
