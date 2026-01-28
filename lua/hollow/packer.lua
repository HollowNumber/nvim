vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
        -- or , branch = '0.2.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use {
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    }


    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('neovim/nvim-lspconfig')

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use {
        'b0o/nvim-tree-preview.lua',
        requires = 'nvim-tree/nvim-tree.lua',
    }

    use 'hrsh7th/nvim-cmp'     -- Completion engine
    use 'hrsh7th/cmp-nvim-lsp' -- LSP completion source
    use 'hrsh7th/cmp-buffer'   -- Buffer completion source
    use 'hrsh7th/cmp-path'     -- Path completion source
    use 'L3MON4D3/LuaSnip'     -- Snippet engine (required)
    use 'saadparwaiz1/cmp_luasnip'

    use 'stevearc/conform.nvim'

    use 'f-person/auto-dark-mode.nvim'

    use {
        'windwp/nvim-autopairs'
    }


    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons"
    }

    use 'OXY2DEV/markview.nvim'


    use 'folke/zen-mode.nvim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)
