local wk = require("which-key")

wk.add({
  { "<leader>pv", vim.cmd.Ex,              desc = "Ex file browser" },
  { "<C-h>",      "<C-w>h",                desc = "Window left" },
  { "<C-j>",      "<C-w>j",                desc = "Window down" },
  { "<C-k>",      "<C-w>k",                desc = "Window up" },
  { "<C-l>",      "<C-w>l",                desc = "Window right" },

  { "<C-Left>",   "<cmd>tabprev<CR>" },
  { "<C-Right>",  "<cmd>tabnext<CR>" },

  { '<leader>x',  '<Plug>PlenaryTestFile', desc = "Plenary test file" },
})

-- For whatever reason these don't work via which-key
vim.keymap.set('c', '<C-a>', "<Home>", { remap = true })
vim.keymap.set('c', '<C-e>', '<End>', { remap = true })
-- wk.add({
--   { "<C-a>", "<Home>", desc = "Move to start of line", mode = "c" },
--   { "<C-e>", "<End>",  desc = "Move to end of line",   mode = "c" }
-- })
--


local gs = require('gitsigns')
gs.setup {
  on_attach = function(bufnr)
    wk.add({
      buffer = bufnr,
      { '<leader>h',  group = "hunk" },
      { '<leader>hp', gs.preview_hunk_inline,       desc = "preview hunk" },
      { '<leader>hu', gs.reset_hunk,                desc = "reset hunk" },
      { '<leader>hs', gs.stage_hunk,                desc = "stage hunk" },
      { '<leader>hw', gs.toggle_current_line_blame, desc = "toggle blame" },
      { '[c',         gs.prev_hunk,                 desc = "previous hunk" },
      { ']c',         gs.next_hunk,                 desc = "next hunk" },
    })
  end
}

wk.add({
  { "<leader>g", vim.cmd.LazyGit, desc = "git" }
})

local telefun = function(fun)
  return function()
    -- reified the require part so telescope can be lazy loaded
    local tb = require('telescope.builtin')
    return tb[fun]()
  end
end

wk.add({
  { '<leader>o',        telefun('oldfiles'),   desc = "old files" },
  { '<leader>f',        telefun('find_files'), desc = "find files" },
  { '<leader><leader>', telefun('live_grep'),  desc = "live grep" },
  { '<leader>b',        telefun('buffers'),    desc = "buffer" },
  { '<F1>',             telefun('help_tags'),  desc = "help tags" },
})

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
wk.add({
  { 'gl', vim.diagnostic.open_float, desc = "diagnostics bubble" },
  { '[d', vim.diagnostic.goto_prev,  desc = "prev diagnostics" },
  { ']d', vim.diagnostic.goto_next,  desc = "next diagnostics" },
})
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
--

wk.add({
  {
    '<C-l>',
    function()
      vim.snippet.jump(1)
    end,
    mode = { 'i', 's' },
    desc = "snippet next",
  },
  {
    '<C-k>',
    function()
      vim.snippet.jump(-1)
    end,
    mode = { 'i', 's' },
    desc = "snippet prev",
  },
})


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
