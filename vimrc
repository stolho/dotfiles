" ================ Vim settings ==============

scriptencoding utf-8
set encoding=utf-8
set autoread    " auto reload if file saved externally

syntax on   " turn on syntax highlighting
filetype indent plugin on
set modeline

:set tabstop=8 expandtab shiftwidth=4 softtabstop=4
:set nu
:set hls

:set bg=dark

autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab

:nnoremap <F8> :setl noai nocin nosi inde=<CR>

