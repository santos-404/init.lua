vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim' -- Packer can manage itself :D

  use { 'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} } }

  use { "Hoffs/omnisharp-extended-lsp.nvim" }

  use { "ellisonleao/gruvbox.nvim" }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use({'hrsh7th/nvim-cmp'})

  use({'hrsh7th/cmp-nvim-lsp'})

  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' } }

  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

  use "nvim-lua/plenary.nvim" 

  use { "ThePrimeagen/harpoon", branch = "harpoon2", requires = { {"nvim-lua/plenary.nvim"} } }

  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

end)
