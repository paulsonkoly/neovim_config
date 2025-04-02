return {
  {
    'hrsh7th/nvim-cmp',
    name = "cmp",
    opts = function(lazy)
      local cmp = require(lazy.name)

      local select_opts = { behavior = cmp.SelectBehavior.Select }
      local opts = {
        sources = {
          { name = 'nvim_lsp', keyword_length = 1 },
          { name = 'buffer',   keyword_length = 3 },
          { name = 'calc' },
          { name = 'path' },
        },
        mapping = {
          -- this used to be C-n, C-p but unfortunately C-q/z/p seems to have meaning in docker containers
          -- and doesn't play nicely with vim
          ['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
          ['<C-j>'] = cmp.mapping.select_next_item(select_opts),

          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }
      }

      return opts
    end,
  },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-calc',
  'hrsh7th/cmp-path',
}
