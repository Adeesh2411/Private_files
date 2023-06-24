vim.cmd('source ~/.vimrc')


-- enable true color support
vim.opt.termguicolors = true

-- Set text width to 80 characters
-- vim.opt.textwidth = 80

-- Automatically wrap text when saving a file
-- vim.cmd('highlight ColorColumn ctermbg=gray')

-- Blink the cursor
--vim.cmd('set guicursor=i:blinkwait700-blinkon400-blinkoff250')
vim.cmd('set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20')
-- change the cursor style
-- vim.cmd(let &t_SI.="\e[5 q")
-- vim.cmd(let &t_SR.="\e[4 q")
-- vim.cmd(let &t_EI.="\e[1 q")

-- set leader key
-- vim.g.mapleader = ','
-- Folding RUle

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

Plug 'romgrk/barbar.nvim'
Plug 'TimUntersberger/neofs'
Plug 'preservim/nerdcommenter'
Plug 'rohit-px2/nvui'

-- color highlight
Plug 'NvChad/nvim-colorizer.lua'

-- function scope in status line
-- Plug 'nvim-treesitter/nvim-treesitter'
-- Plug 'SmiteshP/nvim-gps'

Plug 'neovim/nvim-lspconfig'
-- Plug 'fatih/vim-go'
-- Move to coc, Keeping this for golang
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'


-- Language support
Plug 'tpope/vim-projectionist'
-- Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'


-- Neo AI plugins
Plug 'MunifTanjim/nui.nvim'
Plug 'Bryley/neoai.nvim'

-- nerd tree kind of 
Plug 'nvim-tree/nvim-tree.lua'
Plug 'vifm/vifm.vim'

Plug 'numToStr/Comment.nvim'

-- Flutter development
Plug 'nvim-lua/plenary.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'akinsho/flutter-tools.nvim'
Plug 'dart-lang/dart-vim-plugin'


-- Plug 'sebdah/vim-delve'

-- Golang development
Plug 'fatih/vim-go'
Plug 'ray-x/go.nvim'

-- Telescope extension
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'LukasPietzschmann/telescope-tabs'
Plug 'arjunmahishi/flow.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

-- For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'


Plug 'ray-x/lsp_signature.nvim'
vim.call('plug#end')


-- Go Plugin configuration
vim.cmd[[
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
]]


-- Flutter Configuration
vim.cmd[[
    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_invert_selection=0
    let g:dart_format_on_save = 1
    let g:dartfmt_options = ['--fix', '--line-length 120']
]]


-- ALE Configuration
vim.cmd[[ 
    let g:ale_linters = {'python': ['flake8', 'mypy'],
    \'cpp': ['cc', 'clang', 'cppcheck']
    \}
    let g:ale_fixers = {'*':[], 'python': ['autoimport', 'black', 'isort'],
    \'cpp': ['clang-format'],
    \'dart': ['dartfmt', 'dart-format']
    \}
    let g:ale_linters_ignore = {'cpp': ['clangcheck', 'clangtidy']}
    let g:ale_cpp_cc_options = "-std=c++17 -Wall"
    let g:ale_cpp_clangd_options = "-std=c++17 -Wall"

    let g:ale_lint_on_save = 0
    let g:ale_fix_on_save = 1
    let g:ale_lint_on_enter = 0

    " ale completion engine
    let g:ale_completion_enabled = 0

    let g:ale_set_balloons = 1
    let g:ale_open_list = 0
    let g:ale_sign_error = '●'
    let g:ale_sign_warning = '.'
    let g:ale_floating_window_border = repeat([''], 8)
    let g:ale_set_highlights = 1
    let g:ale_virtualtext_cursor = 'disabled'
    let g:ale_lint_on_insert_leave = 1
]]

vim.g.go_doc_popup_window = 1



require('go').setup()

require "lsp_signature".setup({
    bind = false, -- This is mandatory, otherwise border config won't get registered.
    max_width = 100,
  })

-- alternatively you can override the default configs
require('flutter-tools').setup{
    widget_guides = {
        enabled = true,
    }
}

require("telescope").load_extension("flutter")
require('telescope').load_extension('media_files')
require('telescope-tabs').setup{}
-- Nerd tree / nvim tree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

require("colorizer").setup {
}
-- Default config
-- or with custom configuration
require('Comment').setup({
    ignore = '^$',
    toggler = {
        line = '<leader>c',
        block = '<leader>b',
    },
})

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
    },
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "jpg", "jpeg"},
            -- find command (defaults to `fd`)
            find_cmd = "rg"
        },
    },
}


-- define mappings
local map = vim.api.nvim_set_keymap
map('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
map('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', { noremap = true, silent = true })
map('n', '<Leader>ee', '<Cmd>NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<Leader>ef', '<Cmd>NvimTreeFocus<CR>', {noremap = true, silent = true})
map('n', '<Leader>er', '<Cmd>NvimTreeRefresh<CR>', {noremap = true, silent = true})
map('n', '<Leader>ft', '<Cmd>FlutterOutlineToggle<CR>', {noremap = true, silent = true})
map('n', '<Leader>tt', '<Cmd>Telescope telescope-tabs list_tabs<CR>', {noremap = true, silent = true})

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
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
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

require('neoai').setup{
    -- Below are the default options, feel free to override what you would like changed
    ui = {
        output_popup_text = "NeoAI",
        input_popup_text = "Prompt",
        width = 30,      -- As percentage eg. 30%
        output_popup_height = 80, -- As percentage eg. 80%
        submit = "<Enter>", -- Key binding to submit the prompt
    },
    models = {
        {
            name = "openai",
            model = "gpt-3.5-turbo",
            params = nil,
        },
    },
    register_output = {
        ["g"] = function(output)
            return output
        end,
        ["c"] = require("neoai.utils").extract_code_snippets,
    },
    inject = {
        cutoff_width = 75,
    },
    prompts = {
        context_prompt = function(context)
            return "Hey, I'd like to provide some context for future "
                .. "messages. Here is the code/text that I want to refer "
                .. "to in our upcoming conversations:\n\n"
                .. context
        end,
    },
    mappings = {
        ["select_up"] = "<C-k>",
        ["select_down"] = "<C-j>",
    },
    shortcuts = {
        {
            name = "textify",
            key = "<leader>as",
            desc = "fix text with AI",
            use_context = true,
            prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
            modes = { "v" },
            strip_function = nil,
        },
        {
            name = "gitcommit",
            key = "<leader>ag",
            desc = "generate git commit message",
            use_context = false,
            prompt = function ()
                return [[
                    Using the following git diff generate a consise and
                    clear git commit message, with a short title summary
                    that is 75 characters or less:
                ]] .. vim.fn.system("git diff --cached")
            end,
            modes = { "n" },
            strip_function = nil,
        },
    },
}

vim.api.nvim_set_keymap('n', '<leader>gd', ':GoDoc<CR>', {noremap = true, silent = true})

-- Auto Completion setup. We will use ale for error checking and will use cmp for auto compeltion
-- Fonts : codicons.ttf 
local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}


  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    formatting = {
        format = function(_, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
            return vim_item
        end,
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

cmp.setup.cmdline(':', {
  sources = { --[[ your sources ]] },
  enabled = function()
    -- Set of commands where cmp will be disabled
    local disabled = {
        IncRename = true
    }
    -- Get first word of cmdline
    local cmd = vim.fn.getcmdline():match("%S+")
    -- Return true if cmd isn't disabled
    -- else call/return cmp.close(), which returns false
    return not disabled[cmd] or cmp.close()
  end
}) 

local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end
local nvim_lsp = require('lspconfig')

-- setup languages 
-- GoLang
nvim_lsp['gopls'].setup{
  cmd = {'gopls'},
  -- on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  init_options = {
    usePlaceholders = true,
  }
}
