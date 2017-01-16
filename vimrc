" Most commands/comments come from https://github.com/sontek/dotfiles/

set nocompatible
let mapleader=","

filetype off
call pathogen#incubate()
call pathogen#helptags()

filetype plugin indent on

set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 4 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default
set history=200             " boost history limit

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ 

set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set wildignore+=*.pyc,*.zip,*.pyo


" Paste from clipboard
map <leader>p "+p

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 50
map <leader>b :CtrlPBuffer<cr>

" hide matches on <leader>/
nmap <silent> ,/ :nohlsearch<CR>

" Flake8
"nnoremap <leader>8 :call Flake8()<CR>
"autocmd BufWritePost *.py call Flake8()
"let g:flake8_max_line_length=120
"let g:flake8_max_complexity=10

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Ack shortcut
nnoremap <leader>a :Ack 

set wildmode=longest:full,list:longest "Xavier: do not fully complete path

" let g:jedi#show_function_definition = "0"
let g:jedi#use_tabs_not_buffers = 0

map <leader>G :GundoToggle<CR>

set hidden             "Allow to hide modified buffer

let g:pyflakes_use_quickfix = 0

"au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
" Pressing enter will exit completion mode, keeping current text and do not
" add a new line
let g:SuperTabCrMapping = 1


" Do not color preview window (the one showed by jedi-vim for function
" documentation for exemple), since this break the coloration of the main
" window
let g:airline_exclude_preview = 1

set completeopt=menuone,longest,preview

" Show tabs and trailing spaces
set list
set listchars=tab:>.,trail:.


syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

set t_Co=16

" Enable w!! to sudo after editing
cmap w!! w !sudo tee % >/dev/null

autocmd Filetype gitcommit setlocal spell textwidth=72

set cursorline
set wrap

let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons=1
" let g:syntastic_auto_jump=1
let g:syntastic_enable_highlighting=1
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_html_checkers = ['jshint']

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

