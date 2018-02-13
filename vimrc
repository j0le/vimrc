set nocompatible              " be iMproved, required
filetype off                  " required

" Vundel zeug {{{
    " set the runtime path to include Vundle and initialize
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    let vundle_zeug = 1
    if has('win32') || has('win32unix')
        set rtp+=~/vimfiles/bundle/Vundle.vim/
        call vundle#begin('~/vimfiles/bundle/')
    elseif has('unix')
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    else
        let vundle_zeug = 0
    endif

    if vundle_zeug 
        Plugin 'VundleVim/Vundle.vim'
        Plugin 'rust-lang/rust.vim'
        Plugin 'wincent/command-t'
        Plugin 'scrooloose/nerdtree'
        Plugin 'PProvost/vim-ps1'


        if filereadable('./special/vundlespeciale.vim')
            source ./special/vundlespeciale.vim
        endif

        " All of your Plugins must be added before the following line
        call vundle#end()            " required
        filetype plugin indent on    " required
   endif
" Vundelzeug }}}

set nowrap
set encoding=utf8
set backspace=2
syn on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
nnoremap Q @q
set number relativenumber

"
" autocmd CmdwinEnter * nnoremap <CR> <CR>
" autocmd BufReadPost quickfix nnoremap <CR> <CR>

" CR stuff {{{
    nnoremap <CR> o<ESC>
    "nnoremap <C-J> a<CR><ESC>k$
    nnoremap <C-CR> <C-]>
" CR stuff }}}

" GUI stuff {{{
    set guifont=Consolas:h10:cANSI:qDRAFT
    inoremap <S-CR> <CR><C-O><BS>
    nnoremap <S-CR> O<ESC>
" GUI stuff }}}

" when 'wrap' is set, display as much as possible of hole line
set display=truncate

" move display lines not buffer lines
noremap <Up> g<Up>
noremap <Down> g<Down>
noremap <C-K> g<Up>
noremap <C-J> g<Down>

set whichwrap+=s
noremap <C-L> <space>

" extra mouse key goes backwards
nnoremap <X1Mouse> <C-O>

" yank and delete stuff {{{
    " Y yanks the rest of the line, which is more logic to me
    nnoremap Y y$
    " DD deletes hole line without linebreak
    nnoremap DD ^d$
    " delete hole line and linebreak but yank without linebreak
    nnoremap DDD ^d$"_dd
    nnoremap D<leader> D
    
    " YY yanks complete line without linebreak
    function! s:YankLine()
        let view = winsaveview()
        normal! ^y$
        call winrestview(view)
    endf
    nnoremap YY :<c-u>call <SID>YankLine()<cr>

" yank and delete stuff }}}

map <space> <nop>
let mapleader=" "

" open a link
nnoremap <leader><CR> <C-]>

" jump to end of line
nnoremap E $


" NERDTree mapping
"nnoremap <C-N> :NERDTreeFocus<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" Windows {{{
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap + :<c-u>resize +5<CR>
nnoremap - :<c-u>resize -5<CR>
nnoremap <leader>+ :<c-u>vertical resize +5<CR>
nnoremap <leader>- :<c-u>vertical resize -5<CR>
" Windows }}}

" vim: fdm=marker:
