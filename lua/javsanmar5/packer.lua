-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "ellisonleao/gruvbox.nvim" }
  -- GITHUB THEME
  -- use({
  --     'projekt0n/github-nvim-theme',
  --     config = function()
  --         require('github-theme').setup({
  --             -- ...
  --         })
  --
  --         vim.cmd('colorscheme github_dark')
  --     end
  -- })
  -- TOKYONIGHT THEME
  -- use({
  --  "folke/tokyonight.nvim",
  --  config = function()
  --   require('tokyonight').setup({
  -- 	  -- ...
  --   })
  --
  --   vim.cmd('colorscheme tokyonight')
  --  end
  -- })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})

  use {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
  }

  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' } }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons' } -- Optional for icons
  }

  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

end)
