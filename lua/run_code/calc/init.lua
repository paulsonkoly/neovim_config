local M = {}

function M.Match()
  local ft = vim.filetype.match({ buf = 0 })

  return ft and ft == "calc"
end

function M.Run()
  local pj = require("plenary.job")
  local fn = vim.api.nvim_buf_get_name(0)
  pj:new({
    command = 'calc',
    args = { fn },
    on_exit = M.on_exit,
    on_stdout = M.on_stdout,
  }):start()
end

function M.on_exit(_, return_val)
  if return_val ~= 0 then
    vim.notify("calc exited with non 0 exit code " .. return_val, vim.log.levels.WARN)
  end
end

function M.on_stdout(error, result)
  if error or not result then
    return
  end

  if #result > 50 then
    result = result:sub(1, 47) .. "..."
  end

  vim.notify("calc result: " .. result)
end

return M
