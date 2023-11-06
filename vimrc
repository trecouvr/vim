set nocompatible
let mapleader=','

" Basic

set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
let g:netrw_liststyle = 3   " folder tree view


""" Indentation
filetype plugin indent on
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 4 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
nmap <silent> ,/ :nohlsearch<CR> " hide matches on <leader>/


""" Highlight current line
set cursorline
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE


""" Ruler
set ruler                   " Show some info, even without statuslines.
set laststatus=0            " Never show statusline
set rulerformat=%100(%=%<%f%m\ ›\ %l/%L:%v%)

" Show tabs,  trailing spaces and wrap
set list
set listchars=tab:>.,trail:.
set showbreak=¬\


""" Other

set backspace=indent,eol,start                   " backspace behaviour
set clipboard=unnamed,unnamedplus                " enable clipboard
set encoding=utf8
set hidden                                       " hide buffers, don't close
"set lazyredraw ttyfast      " Performace Tuning
set mouse=a                 " enable mouse support
"set nobackup noswapfile nowritebackup undofile undodir=~/.vim/undo undolevels=99999
set nowrap
set number                  " Display line numbers
"set scrolloff=999           " Always center current line on screen
set showcmd
"set showmatch               " show matching brackets
set term=xterm-256color
set wildmenu wildmode=longest:full,full wildcharm=<Tab>
syntax on

" Enable w!! to sudo after editing
cmap w!! w !sudo tee % >/dev/null

" Colors
hi Normal guibg=NONE ctermbg=NONE

""" Highlight current line
set cursorline
hi CursorLine   cterm=NONE ctermbg=234 ctermfg=NONE
hi CursorLineNr cterm=NONE ctermfg=234 ctermfg=NONE term=bold
hi LineNr       ctermfg=245

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 50
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)\|node_modules\|DS_Store\|__pycache__\|dist$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ }

map <leader>b :CtrlPBuffer<CR>

" Ack shortcut
nnoremap <leader>a :Ack


" Autocomplete Settings
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
