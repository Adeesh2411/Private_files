""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
"set history=500

set encoding=UTF-8

" Enable filetype plugins
"filetype plugin on
"filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 10 lines to the cursor - when moving vertically using j/k
set so=1

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif


set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
" set nobackup
" set nowb
" set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deafult Use spaces instead of tabs
set expandtab

" Use tabs instead of spaces
" set noexpandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" tab and space indicator
" :set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" noremap <F5> :set list!<CR>
" inoremap <F5> <C-o>:set list!<CR>
" cnoremap <F5> <C-c>:set list!<CR>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext
set pastetoggle=<F10>
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ag and put the cursor in the right position
map <leader>g :Ag

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ag, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>


"let g:ycm_show_diagnostics_ui = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" fast close the editor
map <leader>q :q!<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Exit insert mode
inoremap jk <esc>
inoremap kj <esc>

" MacVim change tabs
if has("gui_macvim")
    " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
    " the right side. Ctrl-Shift-Tab goes the other way.
    noremap <C-Tab> :tabnext<CR>
    noremap <C-S-Tab> :tabprev<CR>

    " Switch to specific tab numbers with Command-number
    noremap <D-1> :tabn 1<CR>
    noremap <D-2> :tabn 2<CR>
    noremap <D-3> :tabn 3<CR>
    noremap <D-4> :tabn 4<CR>
    noremap <D-5> :tabn 5<CR>
    noremap <D-6> :tabn 6<CR>
    noremap <D-7> :tabn 7<CR>
    noremap <D-8> :tabn 8<CR>
    noremap <D-9> :tabn 9<CR>
    " Command-0 goes to the last tab
    noremap <D-0> :tablast<CR>
    set guifont=MesloLGS\ NF:h14
    "set guifont=Anonymice\ Powerline:h16

    "set guifont=Source\ Code\ Pro\ for\ Powerline
    "set guifont=InconsolataGo:h18
endif


" show whitespaces HEAVY
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
" show whitespaces MEDIUM
" set listchars=tab:>·,trail:-,extends:>,precedes:<
" set list


" let $LD_LIBRARY_PATH="/local/apollo/package/local_1/AL2012/Clang/Clang-170.0-0/clang-10.0.0/lib"
" let g:coc_node_path = '/local/home/adeach/.nvm/versions/node/v16.15.1/bin/node'

" let g:ycm_clangd_binary_path = '/apollo/env/YouCompleteMeBuilder/bin/x86_64-unknown-linux-gnu-clangd'
" let g:ycm_path_to_python_interpreter = '/apollo/env/YouCompleteMeBuilder/bin/ycm-python'

"if filereadable("runpy")
"  let g:ycm_python_binary_path = './runpy'
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au FileType java call SetWorkspaceFolders()


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Make VIM remember position in file after reopen
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


""""""""""""""""""""""""""""""""""""// MINE //""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged_folder')

" Search tool similar to grep
Plug 'mileszs/ack.vim'

" Asynchronoues Lint Engine Provides annoying arrow missing import

" Git status on NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Syntax highlight for NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Sublime style Minimap
Plug 'severin-lemaignan/vim-minimap'
"Plug 'koron/minimap-map'

" Tab completion needs
Plug 'ervandew/supertab'

" Mean and lean status bar for Vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes
Plug 'tomasiser/vim-code-dark'
Plug 'mhinz/vim-janah'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" Auto end for structures
Plug 'tpope/vim-endwise'

" Show Git diff on file
" Plug 'airblade/vim-gitgutter'

" Visual display indent levels
Plug 'nathanaelkane/vim-indent-guides'

" Code completion engine
" Plug 'ycm-core/YouCompleteMe'
" Plug 'valloric/youcompleteme'

" Adds Icons to Your Plugins
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'

" Used for amazon plugins
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" Plug 'yaegassy/coc-pydocstring', {'do': 'yarn install --frozen-lockfile'}

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }


" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
Plug 'preservim/tagbar'
Plug 'vifm/vifm.vim'

" Go lang tools refer : https://github.com/fatih/vim-go/wiki/Tutorial
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Git blame
Plug 'rhysd/git-messenger.vim'

Plug 'mkitt/tabline.vim'

Plug 'nvie/vim-flake8'

Plug 'tell-k/vim-autopep8'

Plug 'yhat/vim-docstring'

" Multiple color scheme
Plug 'rafi/awesome-vim-colorschemes'
" Debugger for python
" add viminspector 


" for CPP
Plug 'bfrg/vim-cpp-modern'

" for terraform
Plug 'hashivim/vim-terraform'
" Initialize plugin system
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

" color picker
Plug 'KabbAmine/vCoolor.vim'

Plug 'ap/vim-css-color'

call plug#end()


"execute pathogen#infect()
set backspace=indent,eol,start
set hidden
filetype plugin indent on
syntax on

:set expandtab
:set tabstop=4
:set shiftwidth=4
:set confirm
:set mouse=a
:nnoremap <space> i<space><esc>
:set clipboard=unnamedplus

noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>Y "*y
noremap <Leader>P "*p

nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>

nnoremap <silent> <leader>d :vsplit <CR>
nnoremap <silent> <leader>s :split <CR>
nmap <F2> :TagbarToggle<CR>


" git messenger
let g:git_messenger_floating_win_opts = { 'border': 'single' }
let g:git_messenger_popup_content_margins = v:false

" ale configuration
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" To disable the ale altogether
" let g:ale_enabled = 0
"function! LinterStatus() abort
    "let l:counts = ale#statusline#Count(bufnr(''))
    "let l:all_errors = l:counts.error + l:counts.style_error
    "let l:all_non_errors = l:counts.total - l:all_errors
    "return l:counts.total == 0 ? 'OK' : printf(
        "\   '%d⨉ %d⚠ ',
        "\   all_non_errors,
        "\   all_errors
        "\)
"endfunction
"set statusline+=%=
"set statusline+=\ %{LinterStatus()}
"


" Morden CPP
" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" flake8
" ref : https://linuxtut.com/en/4ae1b9ac504567ad4142/ 
"autopep8<sift>+Run with f
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction
function! Autopep8()
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

" Python Folding the docstrings
autocmd FileType python setlocal foldenable foldmethod=syntax

" see first line
set foldtext=getline(v:v:foldstart)
" avoid dash
set fillchars=fold:\ 

"hi Folded term=standout ctermfg=5 ctermbg=7 guifg=Black guibg=#e3c1a5



" Normal color in popup window with 'CursorLine'
hi link gitmessengerPopupNormal CursorLine

" Header such as 'Commit:', 'Author:' with 'Statement' highlight group
hi link gitmessengerHeader Statement

" Commit hash at 'Commit:' header with 'Special' highlight group
hi link gitmessengerHash Special

" History number at 'History:' header with 'Title' highlight group
hi link gitmessengerHistory Title
function! s:setup_git_messenger_popup() abort
    " Your favorite configuration here

    " For example, set go back/forward history to <C-o>/<C-i>
    nmap <buffer><C-o> o
    nmap <buffer><C-i> O
endfunction
autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()


" comment this to turn off relative line number
:set relativenumber number
:set number
:set cursorline
":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END

"Toggle relative line number
nmap <C-L><C-L> :set invrelativenumber<CR>
nmap <C-H><C-H> :/\s\+$<CR>


" quote for a word
nmap <C-Q><C-Q> ysiw"<CR>
" VIFM
nmap <C-F><C-F> :Vifm .<CR>
" Map Ctrl-Backspace to delete the previous word in insert mode.
:set backspace=indent,eol,start

" Tab settings
nnoremap tk  :tabnext<CR>
nnoremap tn  :tabnew<CR>
nnoremap tj  :tabprev<CR>
nnoremap tc  :tabclose<CR>

" VIFM
"nmap <C-V><C-V> :Vifm<CR>
"nmap <C-V><C-S> :VsplitVifm<CR>
"nmap <C-S><C-P> :SplitVifm<CR>
"nmap <C-D><C-V> :DiffVifm<CR>
"nmap <C-T><C-V> :TabVifm<CR>

let python_highlight_all=1

let g:lasttab = 1
nmap tt  :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Sphinx format
let g:pydocstring_formatter = 'sphinx'
nmap <C-D> :PydocstringFormat<CR>
"  filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
"
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified
" files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.js'

" Highlight tab name
function! HiTabs()
    syntax match TAB /\t/ containedin=ALL
highlight TAB ctermbg=red ctermfg=white cterm=underline
endfunction
"au BufEnter,BufRead * call HiTabs()


" Syntastic Defaults
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" aut osuggestions 
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" CtrlP Defaults
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" YCM Settings
" let g:ycm_autoclose_preview_window_after_insertion = 1
" highlight NonText ctermfg=12

" Change Vim's color scheme
" autocmd ColorScheme janah highlight Normal ctermbg=235
" colorscheme janah
" colorscheme codedark
" colorscheme molokai
" colorscheme monokai
" colorscheme dracula
" colorscheme gruvbox



" c++ file comiple and run
" nmap <C-R> :!g++ -std=c++11 % && ./a.out < input.txt <CR>


" Add the template file 
nnoremap <space>t :-1read $HOME/.vim/templates/cpp_sample<CR>/{<CR>o


" let g:airline_theme = 'minimalist'
" let g:airline_theme = 'codedark'

highlight Comment cterm=italic gui=italic

" Highlight docstrings as comments, not string.
syn region pythonDocstring start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError

" Match the brackets
"inoremap { {}<Esc>ha
"inoremap ( ()<Esc>ha
"inoremap [ []<Esc>ha
"inoremap " ""<Esc>ha
"inoremap ' ''<Esc>ha
"inoremap ` ``<Esc>ha

" disable the bell sound
set belloff=all

"blink the cursor
"set guicursor+=a:blinkon0
"set guicursor+=i:blinkon0
"set guicursor+=n:blinkon0
set t_vb=

" Override tab behaviour for Golang
autocmd FileType go setlocal noexpandtab
au BufRead,BufNewFile *.go setlocal textwidth=80

" Override tab behaviour for dart file
autocmd FileType dart setlocal shiftwidth=2
autocmd FileType dart setlocal softtabstop=2




" if exists('$TMUX')
"    let &t_SI .= "\ePtmux;\e\e[=1c\e\\"
"    let &t_EI .= "\ePtmux;\e\e[=2c\e\\"
" else
"    let &t_SI .= "\e[=1c"
"    let &t_EI .= "\e[=2c"
"endif


" let &t_SI.="\e[5 q" "SI = INSERT mode
" let &t_SR.="\e[4 q" "SR = REPLACE mode
" let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon100
set guicursor+=i:blinkwait10


" Put swap, backup and undo files in fixed directories,
" instead of the working directory of the file being edited
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
