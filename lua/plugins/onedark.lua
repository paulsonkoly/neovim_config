return {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local od = require 'onedark'
    od.setup {
      style = 'darker',
   }
    -- Enable theme
    od.load()
  end
}
