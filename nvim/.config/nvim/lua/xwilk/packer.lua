-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('mbbill/undotree')
    use('theprimeagen/harpoon')
    use('terrortylor/nvim-comment')

    -- Themes
    use({
        'rose-pine/neovim',
        as = 'rose-pine'
    })
    use({'tpope/vim-vividchalk', as = 'vividchalk'})

    use({
        'doums/darcula',
        as = 'darcula',
        config = function()
            vim.cmd('colorscheme darcula')
        end
    })
    
    use({
        "rebelot/kanagawa.nvim",
        as = 'kanagawa',
        config = function()
            vim.cmd('colorscheme kanagawa')
        end
    })

    -- Git
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    -- Debugging
    use('mfussenegger/nvim-dap')
    use('mfussenegger/nvim-dap-python')
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
    use('theHamsta/nvim-dap-virtual-text')
    use('nvim-telescope/telescope-dap.nvim')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },

            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/vim-vsnip' },

            -- LSP completion source:
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    
    -- Copilot
    use("github/copilot.vim")

    use('simrat39/rust-tools.nvim')
    use('voldikss/vim-floaterm')
    use({ 'jose-elias-alvarez/null-ls.nvim' })
    use('aklt/plantuml-syntax')
end)
