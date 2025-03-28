require("mason").setup()

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
      }
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
    command = { "golangci-lint", "run", "--out-format", "json", "--show-stats=false" }
  },
  root_markers = { ".git", "go.mod" },
}
vim.lsp.enable("golangci_lint_ls")

local wk = require("which-key")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
wk.add({
  { 'gl', vim.diagnostic.open_float, desc = "diagnostics bubble" },
  { '[d', vim.diagnostic.goto_prev,  desc = "prev diagnostics" },
  { ']d', vim.diagnostic.goto_next,  desc = "next diagnostics" },
})
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    wk.add({
      buffer = ev.buf,
      { 'gD',   vim.lsp.buf.declaration,    desc = "goto declaration" },
      { 'gd',   vim.lsp.buf.definition,     desc = "goto definition" },
      { 'K',    vim.lsp.buf.hover,          desc = "hover help" },
      { 'gi',   vim.lsp.buf.implementation, desc = "goto implementation" },
      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, opts)
      -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      { '<F2>', vim.lsp.buf.rename,         desc = "lsp rename" },
      { '<F4>', vim.lsp.buf.code_action,    mode = { 'n', 'v' },         desc = "lsp code action" },
      { 'gr',   vim.lsp.buf.references,     desc = "goto references" },
      {
        '<F3>',
        function()
          vim.lsp.buf.format { async = true }
        end,
        desc = "lsp reformat"
      },
    })
  end,
})
