return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    return {
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str, _)
              return string.sub(str, 1, 1)
            end,
          }
        },
        lualine_x = {
          'encoding',
          {
            'fileformat',
            symbols = {
              unix = 'unix', -- e712
              dos = 'dos',   -- e70f
              mac = 'mac',   -- e711
            },
          },
          { 'filetype', colored = false }
        },
      },
    }
  end,
}
