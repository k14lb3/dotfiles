local packer_bootstrap, packer, use = unpack(require 'plugins.packer')

packer.startup(function()
  -- Base
  use { 'wbthomason/packer.nvim', opt = true }
  use { 'lewis6991/impatient.nvim' }
  use { 'nvim-lua/plenary.nvim' }

  -- Themes
  use { 'folke/tokyonight.nvim', ext = 'tokyonight' }
  use { 'goolord/alpha-nvim', ext = 'alpha' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'folke/trouble.nvim', ext = 'trouble' }

  -- LSP
  use { 'neovim/nvim-lspconfig', ext = 'lsp' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'ray-x/lsp_signature.nvim' }

  -- Syntax
  use { 'nvim-treesitter/nvim-treesitter', ext = 'treesitter' }

  -- Completion
  use { 'hrsh7th/nvim-cmp', ext = 'cmp' }
  use { 'onsails/lspkind.nvim' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', ext = 'gitsigns' }

  -- Bufferline
  use { 'akinsho/bufferline.nvim', ext = 'bufferline' }
  use { 'moll/vim-bbye' }

  -- Statusline
  use { 'nvim-lualine/lualine.nvim', ext = 'lualine' }

  -- File Explorer
  use { 'kyazdani42/nvim-tree.lua', ext = 'tree' }

  -- File Finder
  use { 'nvim-telescope/telescope.nvim', ext = 'telescope' }

  -- Terminal
  use { 'akinsho/toggleterm.nvim', ext = 'toggleterm' }

  -- Pane Navigation
  use { 'christoomey/vim-tmux-navigator', ext = 'tmux-navigator' }

  -- Indent Guide
  use { 'lukas-reineke/indent-blankline.nvim', ext = 'indentline' }

  -- Autopairs and Tags
  use { 'windwp/nvim-autopairs', ext = 'autopairs' }
  use { 'windwp/nvim-ts-autotag' }

  -- Comment
  use { 'numToStr/Comment.nvim', ext = 'comment' }

  -- Colorizer
  use { 'norcalli/nvim-colorizer.lua', ext = 'colorizer' }

  -- Notifications
  use { 'rcarriga/nvim-notify', ext = 'notify' }

  -- Markdown Preview
  use { 'iamcco/markdown-preview.nvim', ext = 'markdown-preview' }

  if packer_bootstrap then
    packer.sync()
  end
end)
