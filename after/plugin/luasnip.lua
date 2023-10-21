local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
  history = true,
  update_events = "TextChanged, TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choices available", "Error" } }
      }
    }
  }
})

vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })
