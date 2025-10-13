local runner = require("run_code")

vim.keymap.set('n', '-',
  function() vim.api.nvim_command("Oil") end,
  { desc = "oil" })

vim.keymap.set('n', '<leader>x', runner.Run, { desc = "Run file / testsuite" })

vim.keymap.set('n', "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set('n', "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set('n', "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set('n', "<C-l>", "<C-w>l", { desc = "Window right" })

vim.keymap.set('n', "<S-Left>", "<cmd>tabprev<CR>", { desc = "Tab prev" })
vim.keymap.set('n', "<S-Right>", "<cmd>tabnext<CR>", { desc = "Tab next" })

vim.keymap.set('c', '<C-a>', "<Home>", { remap = true })
vim.keymap.set('c', '<C-e>', '<End>', { remap = true })

local gs = require('gitsigns')
gs.setup {
  on_attach = function(_)
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk_inline, { desc = "preview hunk", buffer = true })
    vim.keymap.set('n', '<leader>hu', gs.reset_hunk, { desc = "reset hunk", buffer = true })
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = "stage hunk", buffer = true })
    vim.keymap.set('n', '<leader>hw', gs.toggle_current_line_blame, { desc = "toggle blame", buffer = true })
    vim.keymap.set('n', '[c', gs.prev_hunk, { desc = "previous hunk", buffer = true })
    vim.keymap.set('n', ']c', gs.next_hunk, { desc = "next hunk", buffer = true })
  end
}

vim.keymap.set('n', "<leader>g", vim.cmd.LazyGit, { desc = "git" })

local telefun = function(fun)
  return function()
    -- reified the require part so telescope can be lazy loaded
    local tb = require('telescope.builtin')
    return tb[fun]()
  end
end

vim.keymap.set('n', '<leader>o', telefun('oldfiles'), { desc = "old files" })
vim.keymap.set('n', '<leader>f', telefun('find_files'), { desc = "find files" })
vim.keymap.set('n', '<leader><leader>', telefun('live_grep'), { desc = "live grep" })
vim.keymap.set('n', '<leader>b', telefun('buffers'), { desc = "buffer" })
vim.keymap.set('n', '<leader>/', telefun('current_buffer_fuzzy_find'), { desc = "find in buffer" })
vim.keymap.set('n', '<F1>', telefun('help_tags'), { desc = "help tags" })

local function goto_diag(count)
  return function()
    vim.diagnostic.jump({ count = count, float = true })
  end
end

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "diagnostics bubble" })
vim.keymap.set('n', '[d', goto_diag(-1), { desc = "prev diagnostics" })
vim.keymap.set('n', ']d', goto_diag(1), { desc = "next diagnostics" })
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
--

-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(_)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "goto declaration", buffer = true })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "goto definition", buffer = true })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "hover help", buffer = true })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "goto implementation", buffer = true })
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, { desc = "lsp rename", buffer = true })
    vim.keymap.set({ 'n', 'v' }, '<F4>', vim.lsp.buf.code_action,
      { buffer = true, desc = "lsp code action" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "goto references", buffer = true })
    vim.keymap.set('n', '<F3>',
      function()
        vim.lsp.buf.format { async = true }
      end,
      { desc = "lsp reformat", buffer = true })
  end,
})
