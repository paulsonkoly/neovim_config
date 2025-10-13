-- lua test file runner
-- expects a tests directory in project root, and a minimal_init in the tests directory.
-- runs plenary test_directory on it.
local M = {}

function M.Match()
  -- figure out the test harness file path
  local root = vim.fs.root(0, ".git")
  if not root then
    return false
  end

  local tests_path = vim.fs.joinpath(root, "tests")
  local lstat = vim.uv.fs_lstat(tests_path)
  if not lstat or lstat.type ~= "directory" then
    return false
  end

  local minimal_init = vim.fs.joinpath(tests_path, "minimal_init.lua")
  lstat = vim.uv.fs_lstat(minimal_init)
  if not lstat or lstat.type ~= "file" then
    -- if the first 2 matched then probably this is supposed to be a lua run so it's safe to raise a warning on notify
    vim.notify("minimal_init.lua not found, can't run tests", vim.log.levels.ERROR)
    return false
  end

  M._tests_path = tests_path
  M._minimal_init = minimal_init

  return true
end

function M.Run()
  local pt = require("plenary.test_harness")
  pt.test_directory(M._tests_path, { minimal_init = M._minimal_init })
end

return M
