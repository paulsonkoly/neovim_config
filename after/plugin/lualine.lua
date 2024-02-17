local lualine = require('lualine')

lualine.setup {
  sections = {
    lualine_x = {
      { 'encoding' },
      { 'fileformat',
        symbols = {
          unix = 'unix', -- e712
          dos = 'dos', -- e70f
          mac = 'mac', -- e711
        } },
      { 'filetype' }
    }
  }
}
