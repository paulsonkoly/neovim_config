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

  use 'tpope/vim-fugitive'

  use 'idanarye/vim-merginal'

  use 'lewis6991/gitsigns.nvim'

  use 'mattn/emmet-vim'

  use 'TabbyML/vim-tabby'

  use 'sebdah/vim-delve'

  use 'williamboman/mason.nvim'

  -- calc
  use 'paulsonkoly/calc.nvim'

  -- LSP Support
  use 'neovim/nvim-lspconfig'

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
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
