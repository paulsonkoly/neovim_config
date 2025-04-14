vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.colorcolumn = "120"
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.showmode = false
vim.opt.laststatus = 3

-- disable inline diagnostics text
-- maps working: gl, [d, ]d
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

vim.filetype.add({ extension = { calc = "calc" } })

vim.cmd.colorscheme "gruvbox"
