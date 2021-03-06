" Pathogen settings to auto-load new plugins (http://www.vim.org/scripts/script.php?script_id=2332)
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" Make Vim more useful (turn off vi compatibility)
set nocompatible

" Set <leader> to ,
let mapleader = ","

" prevents security exploits dealing with modelines in files
set modelines=0

" expands tabs to 4 spaces, etc
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set shiftwidth=2
    set softtabstop=2
    set noexpandtab
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
  endif
endfunction
nmap <leader><tab> :call TabToggle()<cr>

" Indentation rules
set autoindent
set cindent

set foldmethod=indent
set foldcolumn=3
set foldlevel=8

" Show TextMate-like whitespace chars for tab and end of line
set list
set listchars=tab:▸\ ,eol:¬

" Line-wrapping options
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Enhance command-line completion
set wildmenu

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Highlight results as you search
set incsearch
set showmatch
set hlsearch

" Clear a search by typing ,<space>
nnoremap <leader><space> :noh<cr>

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
" set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=156

" Highlight current line
set cursorline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
set hlsearch

" If searching all lowercase, search case-insensitive.
" If any characters are uppercase, search case-sensitive.
set ignorecase
set smartcase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2
set statusline+=%=%10((%l,%c)%)

" Enable mouse in all modes
set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Remaps / search key to use standard regex instead of vim regex
nnoremap / /\v
vnoremap / /\v

" Remap F1 to Esc to avoid accidentally opening help docs
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Turn on line numbers by typing ,num
nnoremap <leader>num :set number<cr>
nnoremap <leader>rnum :set relativenumber<cr>
nnoremap <leader>nonum :set nonumber<cr>:set norelativenumber<cr>

" Remaps % to tab to navigate matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Set color scheme
colorscheme solarized
let hr = str2nr(strftime('%H'))
" Between 6:00 AM and 7:00 PM, use a light background
" Otherwise, use a dark background
if hr >= 6 && hr <= 19
    set background=light
else
    set background=dark
endif

" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Enable file type detection
filetype on

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

" Set proper indentation for .json and .yml
autocmd FileType json setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml set shiftwidth=2 softtabstop=2

" Flake8 biznatch

let g:flake8_max_line_length=120
let g:flake8_ignore="E501,W503"
autocmd BufWritePost *.py call Flake8()

let NERDSpaceDelims=1

" Save on losing focus
au FocusLost * :wa

" Directory for custom snippets
let g:UltiSnipsSnippetDirectories=["custom_snippets"]

" Snippet insert with Cmd-J and Shift-Cmd-J
let g:UltiSnipsExpandTrigger="<D-j>"
let g:UltiSnipsJumpForwardTrigger = "<D-j>"
let g:UltiSnipsJumpBackwardTrigger = "<s-D-j>"

"  move text and rehighlight -- vim tip_id=224
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,W503'

let g:syntastic_javascript_checkers = ['eslint', 'jslint']
let g:syntastic_javascript_eslint_exec = '$(npm bin)/eslint'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

" Turn off JSHint autocheck
let b:jshint_disabled = 1
