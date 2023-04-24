vim.cmd('source ~/.vimrc')


-- enable true color support
vim.opt.termguicolors = true

-- set leader key
-- vim.g.mapleader = ','

-- install plug if not already installed
local plug_path = vim.fn.stdpath('data') .. '/plugged/plug.vim'
if vim.fn.filereadable(plug_path) == 0 then
    vim.fn.system({'curl', '-fLo', plug_path, '--create-dirs', 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'})
    vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'TimUntersberger/neofs'
Plug 'preservim/nerdcommenter'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'rohit-px2/nvui'

-- color highlight
Plug 'norcalli/nvim-colorizer.lua'

-- range highlight
Plug 'winston0410/range-highlight.nvim'

-- debugger
-- Plug 'mfussenegger/nvim-dap'
-- Plug 'rcarriga/nvim-dap-ui'

-- documentation viewer
-- Plug 'folke/neodev.nvim'

-- function scope in status line
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'SmiteshP/nvim-gps'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neovim/nvim-lspconfig'
Plug 'fatih/vim-go'
Plug 'dense-analysis/ale'

vim.call('plug#end')










-- Default config
require("nvim-gps").setup()

-- require("neodev").setup({
--  library = { plugins = { "nvim-dap-ui" }, types = true },
-- })

require'colorizer'.setup()

require('neofs').setup {
    devicons = true
}
-- Set statusline
require('lualine').setup {
  options = {
    theme = 'gruvbox',
    icons_enabled = true,
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {'nvim-tree'}
}


-- configure telescope
require('telescope').setup {
    defaults = {
        prompt_prefix = '🔍 ',
        selection_caret = ' ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'flex',
        layout_config = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
            width = 0.75,
            height = 0.85,
        },
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        path_display = {},
        winblend = 0,
        preview_cutoff = 120,
        results_width = 0.8,
        results_height = 1,
        border = {},
        borderchars = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    }
}

-- define mappings
local map = vim.api.nvim_set_keymap
map('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
map('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', { noremap = true, silent = true })
map('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fs", function()
  require("neofs").open()
end, {noremap = true})
-- map('n', '<Leaderff', '<Cmd>:Vifm .<CR>', { noremap = true, silent = true })
--


-- vim.g.barbar_auto_setup = false -- disable auto-setup
require'barbar'.setup {
  -- WARN: do not copy everything below into your config!
  --       It is just an example of what configuration options there are.
  --       The defaults are suitable for most people.

  -- Enable/disable animations
  animation = true,

  icons = {
    -- Configure the base icons on the bufferline.
    buffer_index = true,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = true,
    },
    separator = {left = '▎', right = ''},

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '●'},
    pinned = {button = '車', filename = true, separator = {right = ''}},

  },



  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    -- Use the default values: {event = 'BufWinLeave', text = nil}
    NvimTree = true,
    -- Or, specify the text used for the offset:
    undotree = {text = 'undotree'},
    -- Or, specify the event which the sidebar executes when leaving:
    ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify both
    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },

}
