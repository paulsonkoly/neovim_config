-- avoid loading mason just to get these in the path
vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin/:' .. vim.env.PATH

vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  single_file_support = true,
  log_level = 2,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim',
          -- plenary test stuff
          "describe", "it", "pending", "before_each", "after_each", "clear",
        }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    }
  }
}
vim.lsp.enable("lua_ls")

vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
  root_markers = { ".git", "go.mod" },
  settings = {
    gopls = {
      usePlaceholders = true
    }
  },
  on_attach = function () vim.opt_local.formatprg = "" end
}
vim.lsp.enable("gopls")

vim.lsp.config.golangci_lint_ls = {
  cmd = { "golangci-lint-langserver" },
  filetypes = { "go", "gomod" },
  init_options = {
    command = { "golangci-lint", "run", "--output.json.path", "stdout", "--show-stats=false", "--issues-exit-code=1" },
  },
  root_markers = { ".git", "go.mod" },
}
vim.lsp.enable("golangci_lint_ls")

vim.lsp.config.pbls = {
  cmd = { "pbls" },
  filetypes = { "proto" },
  single_file_support = true,
}
vim.lsp.enable("pbls")
