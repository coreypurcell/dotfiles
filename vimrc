call pathogen#runtime_prepend_subdirectories(expand('~/.vimbundles'))

set hidden
nnoremap ' `
nnoremap ` '

let mapleader = ","

set history=1000

runtime macros/matchit.vim

set wildmenu
set wildmode=list:longest



set ignorecase
set smartcase

set title

set scrolloff=3

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set number

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
filetype on
if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif

au BufNewFile,BufRead *.scss setfiletype css

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
nmap <silent> <leader>n :silent :nohlsearch<CR>


set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

set visualbell

set sts=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,indent

map <Leader>n :NERDTree<Enter>
