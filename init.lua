vim.cmd('source ~/.vimrc')


-- enable true color support
vim.opt.termguicolors = true

-- Set text width to 80 characters
vim.opt.textwidth = 80

-- Automatically wrap text when saving a file
vim.cmd('highlight ColorColumn ctermbg=gray')

-- Blink the cursor
--vim.cmd('set guicursor=i:blinkwait700-blinkon400-blinkoff250')
vim.cmd('set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20')
-- change the cursor style
-- vim.cmd(let &t_SI.="\e[5 q")
-- vim.cmd(let &t_SR.="\e[4 q")
-- vim.cmd(let &t_EI.="\e[1 q")

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

Plug 'romgrk/barbar.nvim'
Plug 'TimUntersberger/neofs'
Plug 'preservim/nerdcommenter'
Plug 'rohit-px2/nvui'

-- color highlight
Plug 'NvChad/nvim-colorizer.lua'

-- function scope in status line
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'SmiteshP/nvim-gps'

Plug 'neovim/nvim-lspconfig'
-- Plug 'fatih/vim-go'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'

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

-- Plug 'sebdah/vim-delve'

-- Golang development
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'

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
nnoremap <leader>gd <cmd>Telescope gopls document_symbols<cr>
nnoremap <leader>gD <cmd>Telescope gopls definitions<cr>
]]



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

    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 1
    let g:ale_lint_on_enter = 0

    " ale completion engine
    let g:ale_completion_enabled = 1

    let g:ale_set_balloons = 1
    let g:ale_open_list = 0
    let g:ale_sign_error = '●'
    let g:ale_sign_warning = '.'
    let g:ale_floating_window_border = repeat([''], 8)
    let g:ale_set_highlights = 1
    let g:ale_virtualtext_cursor = 'disabled'

]]

vim.g.go_doc_popup_window = 1
require('lspconfig').gopls.setup{}


-- alternatively you can override the default configs
require("flutter-tools").setup {
  ui = {
    -- the border type to use for all floating windows, the same options/formats
    -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
    border = "rounded"
    -- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
    -- please note that this option is eventually going to be deprecated and users will need to
    -- depend on plugins like `nvim-notify` instead.
  },
  decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = false,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = false,
      -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
      -- this will show the currently selected project configuration
      project_config = false,
    }
  },
  fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = ">", -- character to use for close tag e.g. > Widget
    enabled = false -- set to false to disable
  },
  dev_log = {
    enabled = true,
    notify_errors = false, -- if there is an error whilst running then notify the user
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  dev_tools = {
    autostart = false, -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false -- if true this will open the outline automatically when it is first populated
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "â– ", -- the virtual text character to highlight
    },
    on_attach = my_custom_on_attach,
    capabilities = my_custom_capabilities, -- e.g. lsp_status capabilities
    --- OR you can specify a function to deactivate or change or control how the config is created
    -- see the link below for details on each option:
    -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
      updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    }
  }
}



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
    }
}


-- define mappings
local map = vim.api.nvim_set_keymap
map('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true, silent = true })
map('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
map('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', { noremap = true, silent = true })
map('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
map('n', '<Leader>ee', '<Cmd>NvimTreeToggle<CR>', {noremap = true, silent = true})
map('n', '<Leader>ef', '<Cmd>NvimTreeFocus<CR>', {noremap = true, silent = true})
map('n', '<Leader>er', '<Cmd>NvimTreeRefresh<CR>', {noremap = true, silent = true})

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

function GoDocWithTelescope()
   vim.cmd(':GoDoc')
   local results = vim.fn.getqflist()
   require('telescope.builtin').quickfix({
      prompt_title = ':GoDoc results',
      entries = results,
      layout_config = {
         width = 0.9,
         height = 0.6,
         preview_cutoff = 120,
         horizontal = {preview_width = 0.5},
         vertical = {preview_height = 0.5},
         borders = true,
         border = {
            {"╭", "FloatBorder"},
            {"─", "FloatBorder"},
            {"╮", "FloatBorder"},
            {"│", "FloatBorder"},
            {"╯", "FloatBorder"},
            {"─", "FloatBorder"},
            {"╰", "FloatBorder"},
            {"│", "FloatBorder"},
         },
         borderhighlight = "FloatBorder",
         bordercolor = "white",
         prompt_position = 'top',
         padding = {
            top = 10,
            bottom = 10,
            left = 10,
            right = 10,
         },
      },
   })
end
vim.api.nvim_set_keymap('n', '<leader>gd', ':lua GoDocWithTelescope()<CR>', {noremap = true, silent = true})
