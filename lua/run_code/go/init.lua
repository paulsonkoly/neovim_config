-- runner that expects a single go file to run, useful for 1 file coding challanges.
-- result goes to vim notification. Outputs like stderr etc are ignored.
local M = {}

function M.Match()
  local ft = vim.filetype.match({ buf = 0 })

  return ft and ft == "go"
end

local pj = require("plenary.job")

function M.Run()
  local fn = vim.api.nvim_buf_get_name(0)
  pj:new({
    command = 'go',
    args = { 'run', fn },
    on_exit = M.on_exit,
    on_stdout = M.on_stdout,
  }):start()
end

function M.on_exit(_, return_val)
  if return_val ~= 0 then
    vim.notify("go exited with non 0 exit code " .. return_val, vim.log.levels.WARN)
  end
end

function M.on_stdout(error, result)
  if error or not result then
    return
  end

  if #result > 50 then
    result = result:sub(1, 47) .. "..."
  end

  vim.notify("go result: " .. result)
end

return M
