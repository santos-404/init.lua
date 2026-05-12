vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim") -- Packer can manage itself :D

    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })

    use({ "Hoffs/omnisharp-extended-lsp.nvim" })
    use({ "seblyng/roslyn.nvim" })

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    use({ "hrsh7th/nvim-cmp" })

    use({ "hrsh7th/cmp-nvim-lsp" })

    use({ "L3MON4D3/LuaSnip", requires = { "rafamadriz/friendly-snippets" } })

    use({ "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" } })

    use("nvim-lua/plenary.nvim")

    use({ "ThePrimeagen/harpoon", branch = "harpoon2", requires = { { "nvim-lua/plenary.nvim" } } })

    use({ "numToStr/Comment.nvim", config = function() require("Comment").setup() end, })

    use("tpope/vim-fugitive")

    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })

    use({ "sphamba/smear-cursor.nvim" })

    use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })

    -- Themes
    use({ "ellisonleao/gruvbox.nvim" })
    use({ "folke/tokyonight.nvim" })
    use({ "catppuccin/nvim", as = "catppuccin" })
    use({ "sainnhe/everforest" })
    use({ "kepano/flexoki-neovim" })
    use({ "rebelot/kanagawa.nvim" })
    use({ "rose-pine/neovim", as = "rose-pine" })
    use({ "EdenEast/nightfox.nvim" })
    use({ "ribru17/bamboo.nvim" })
    use({ "bjarneo/ethereal.nvim" })
    use({ "bjarneo/aether.nvim" })
    use({ "bjarneo/hackerman.nvim" })
    use({ "bjarneo/vantablack.nvim" })
    use({ "bjarneo/white.nvim" })
    use({ "tahayvr/matteblack.nvim" })
    use({ "OldJobobo/miasma.nvim" })
    use({ "OldJobobo/retro-82.nvim" })
    use({ "omacom-io/lumon.nvim" })
    use({ "gthelding/monokai-pro.nvim" }) 

    use({ "nvim-mini/mini.indentscope" })

    use({ "folke/flash.nvim" })
end)
