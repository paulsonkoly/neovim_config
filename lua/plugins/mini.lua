return {
  { 'echasnovski/mini.ai',       config = true },
  { 'echasnovski/mini.surround', config = true },
  {
    'echasnovski/mini.notify',
    config = function(lazy)
      local mn = require(lazy.name)
      mn.setup({
        window = {
          config = {
            border = "rounded"
          },
        },
      })
      vim.notify = mn.make_notify()
    end
  },
  { 'echasnovski/mini.align', config = true },
  {
    'echasnovski/mini.icons',
    config = function(lazy)
      local mi = require(lazy.name)
      mi.mock_nvim_web_devicons()
    end
  },
}
