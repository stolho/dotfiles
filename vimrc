" ================ Vim settings ==============

scriptencoding utf-8
set encoding=utf-8
set nocompatible    " Be iMproved
set autoread    " auto reload if file saved externally

set backspace=indent,eol,start

syntax on	" Turn on syntax highlighting

autocmd BufReadPre * if getfsize(expand("%")) > 5000000 | call s:setLargFile() | endif

function! s:setLargFile()
  syntax off
endfunction

set history=1000   " number of command lines to remember
set list           " highlight whitespace
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮

" always unfold
set foldlevel=99
set colorcolumn=80

" give me my system clipboard
set clipboard=unnamed

set showcmd
set cursorline

set mouse=a

set ruler

" ================ Install plugins ==============
let s:first_time_launch = 0
if empty(glob("~/.vim/autoload/plug.vim"))
  silent execute '!mkdir -p ~/.vim/autoload'
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
  " Open the project tree and expose current file in the NerdTree with Ctrl-\
  nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>
  " If nerd tree is the last window - quit
  autocmd bufenter * if (winnr("$") == 1 && exists('b:NERDTreeType') && b:NERDTreeType == "primary") | q | endif

" Faster large files
Plug 'mhinz/vim-hugefile'
  let g:hugefile_trigger_size=2


Plug 'rking/ag.vim'
Plug 'thinca/vim-quickrun'

Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'


" Don't touch sign column
" let g:gitgutter_override_sign_column_highlight = 0
Plug 'airblade/vim-gitgutter' " Show git diff in the gutter


Plug 'tpope/vim-fugitive'
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gr :Gremove<CR>
  set diffopt=vertical " Show always vertical diff

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'


Plug 'scrooloose/syntastic'
  let g:syntastic_mode_map = {'mode': 'active','active_filetypes': ['js', 'py'], 'passive_filetypes': ['html'] }
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0


Plug 'nvie/vim-flake8'

Plug 'mattn/emmet-vim', { 'for': 'html' }

Plug 'altercation/vim-colors-solarized'

filetype plugin indent on

call plug#end()

if s:first_time_launch
  PlugInstall
endif



" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set shiftround
set linebreak
let &showbreak='↪ '

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=manual   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Scrolling ========================
"
set scrolloff=1         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Appearance
set laststatus=2   " Always show the statusline
set t_Co=256       " 256 colors terminal

set encoding=utf-8
set term=xterm-256color
set t_ut=          " disable background color erase, play nicely with tmux
set termencoding=utf-8
set number
set ttimeoutlen=50  " Reduce annoying delay for key codes, especially <Esc>..."


set background=dark
" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
let g:solarized_termcolors=256

hi! Visual ctermfg=White ctermbg=125 term=none cterm=none

" ================ Search Settings  =================

set incsearch       " Find the next match as we type the search
set hlsearch        " Hilight searches by default
set viminfo='100,f1 " Save up to 100 marks, enable capital marks
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set diffopt+=vertical " i love vertical diffs

" ================ Keyboard shortcuts  =================

" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>


" ================ Python  =================

autocmd BufWritePost *.py call Flake8()
autocmd FileType python set softtabstop=4|set tabstop=4|set shiftwidth=4|set expandtab

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


" If nerd tree is the last window - quit
autocmd bufenter * if (winnr("$") == 1 && exists('b:NERDTreeType') && b:NERDTreeType == "primary") | q | endif

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" ================ YAML  =================
autocmd FileType yaml set softtabstop=2|set tabstop=2|set shiftwidth=2|set expandtab
