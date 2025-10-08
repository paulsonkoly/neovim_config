-- avoid loading mason just to get these in the path
vim.env.PATH = vim.fn.stdpath('data') .. '/mason/bin/:' .. vim.env.PATH

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
-- capabilities.textDocument.completion.completionItem.snippetSupport = false

-- Setup language servers.

vim.lsp.config('*', {
  capabilities = capabilities,
  root_markers = { ".git" },
})

vim.lsp.config.solargraph = {
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  init_options = {
    formatting = true
  },
  settings = {
    solargraph = {
      diagnostics = true,
    }
  },
}
vim.lsp.enable('solargraph')

vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  single_file_support = true,
  log_level = 2,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
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
  }
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
