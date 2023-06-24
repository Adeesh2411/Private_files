-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup({
    function(use)
        -- packer plugin manager
        use('wbthomason/packer.nvim')
        use('nvim-lua/plenary.nvim')
        use('nvim-telescope/telescope.nvim')
        use('nvim-lualine/lualine.nvim')
        use('nvim-tree/nvim-web-devicons')

        use('romgrk/barbar.nvim')
        use('TimUntersberger/neofs')
        use('preservim/nerdcommenter')
        use('rohit-px2/nvui')

        -- color highlight
        use('NvChad/nvim-colorizer.lua')

        -- function scope in status line
        -- Plug 'nvim-treesitter/nvim-treesitter'
        -- Plug 'SmiteshP/nvim-gps'

        use('neovim/nvim-lspconfig')
        -- Plug 'fatih/vim-go'
        -- Move to coc, Keeping this for golang
        use('dense-analysis/ale')
        use('preservim/tagbar')


        -- Language support
        use('tpope/vim-projectionist')
        use('neoclide/coc.nvim')
        use('jiangmiao/auto-pairs')


        -- Neo AI plugins
        use('MunifTanjim/nui.nvim')
        use('Bryley/neoai.nvim')

        -- nerd tree kind of 
        use('nvim-tree/nvim-tree.lua')
        use('vifm/vifm.vim')

        use('numToStr/Comment.nvim')

        -- Flutter development
        use('stevearc/dressing.nvim')
        use('akinsho/flutter-tools.nvim')
        use('dart-lang/dart-vim-plugin')


        -- Plug 'sebdah/vim-delve'

        -- Golang development
        use('fatih/vim-go')
        use('ray-x/go.nvim')

        -- Telescope extension
        use('nvim-lua/popup.nvim')
        use('nvim-telescope/telescope-media-files.nvim')
        use('LukasPietzschmann/telescope-tabs')
        use('arjunmahishi/flow.nvim')

    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})
