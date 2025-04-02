return {
  { 'echasnovski/mini.ai', config = true},
  { 'echasnovski/mini.surround', config = true},
  {
    'echasnovski/mini.notify',
    config = function(lazy)
      local mn = require(lazy.name)
      vim.notify = mn.make_notify()
    end
  },
  { 'echasnovski/mini.align', config = true},
}
