-- extends the default settings with overrides
-- @param section: The default value of the section, a table with components as entries.
-- @param component: The component name to extend. Eg. 'mode'.
-- @param options: The options to merge.
local extend_component = function(section, component, options)
  local new = {}

  for _, comp in ipairs(section) do
    if comp == component then
      comp = vim.tbl_extend('force', { comp }, options)
    end

    table.insert(new, comp)
  end

  return new
end

-- vim.print(extend_component({ "x" }, "x", { boo = "hoo" }))                                    -- > {"x" , boo = "hoo" }
-- vim.print(extend_component({ "x", { "y", boo = "noo", doo = "you" } }, "y", { boo = "hoo" })) -- > {"x", { "y", boo = "hoo", doo="you"}}


return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  name = 'lualine',
  opts = function(lazy)
    local ll = require(lazy.name)

    local default = ll.get_config()

    return {
      options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '|', right = '|' },
      },
      sections = {
        lualine_a = extend_component(default.sections.lualine_a, 'mode', {
          fmt = function(str, _)
            return string.sub(str, 1, 1)
          end
        }),
        lualine_x = extend_component(default.sections.lualine_x, 'fileformat', {
          symbols = {
            unix = 'unix', -- e712
            dos = 'dos',   -- e70f
            mac = 'mac',   -- e711
          },
        }),
      },
    }
  end,
}
