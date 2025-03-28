return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use 'nvim-treesitter/playground'

  use 'Myzel394/easytables.nvim'

  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use "folke/which-key.nvim"

  -- mini
  use 'echasnovski/mini.ai'
  use 'echasnovski/mini.surround'
  use 'echasnovski/mini.notify'
  use 'echasnovski/mini.icons'
  use 'echasnovski/mini.align'

  use 'lewis6991/gitsigns.nvim'

  use 'mattn/emmet-vim'

  use 'MeanderingProgrammer/render-markdown.nvim'

  use 'williamboman/mason.nvim'

  -- calc
  use 'paulsonkoly/calc.nvim'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'

  use 'L3MON4D3/LuaSnip'

  use 'numToStr/Comment.nvim'

  use {
    'phaul/shapeshifter.nvim',
    requires = { { 'nvim-treesitter/nvim-treesitter' } }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
end)
