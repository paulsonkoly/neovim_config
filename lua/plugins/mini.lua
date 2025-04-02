return {
  'echasnovski/mini.ai',
  'echasnovski/mini.surround',
  {
    'echasnovski/mini.notify',
    config = function(lazy)
      local mn = require(lazy.name)
      vim.notify = mn.make_notify()
    end
  },
  'echasnovski/mini.align',
}
