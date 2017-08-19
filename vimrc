set nocompatible              " be iMproved, required
filetype off                  " required

" Vundel zeug {{{
    " set the runtime path to include Vundle and initialize
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    let vundle_zeug = 1
    if has('win32')
        set rtp+=~/vimfiles/bundle/Vundle.vim/
        call vundle#begin('%USERPROFILE%/vimfiles/bundle/')
    elseif has('unix')
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    else
        let vundle_zeug = 0
    endif

    if vundle_zeug 
        " let Vundle manage Vundle, required
        Plugin 'VundleVim/Vundle.vim'

        " The following are examples of different formats supported.
        " Keep Plugin commands between vundle#begin/end.
        " plugin on GitHub repo
        "Plugin 'tpope/vim-fugitive'
        " plugin from http://vim-scripts.org/vim/scripts.html
        "Plugin 'L9'
        " Git plugin not hosted on GitHub
        "Plugin 'git://git.wincent.com/command-t.git'
        " git repos on your local machine (i.e. when working on your own plugin)
        "Plugin 'file:///home/gmarik/path/to/plugin'
        " The sparkup vim script is in a subdirectory of this repo called vim.
        " Pass the path to set the runtimepath properly.
        "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
        " Install L9 and avoid a Naming conflict if you've already installed a
        " different version somewhere else.
        "Plugin 'ascenator/L9', {'name': 'newL9'}

        Plugin 'rust-lang/rust.vim'
        Plugin 'wincent/command-t'
        Plugin 'scrooloose/nerdtree'


        if filereadable('./special/vundlespeciale.vim')
            source ./special/vundlespeciale.vim
        endif

        " All of your Plugins must be added before the following line
        call vundle#end()            " required
        filetype plugin indent on    " required
        " To ignore plugin indent changes, instead use:
        "filetype plugin on
        "
        " Brief help
        " :PluginList       - lists configured plugins
        " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
        " :PluginSearch foo - searches for foo; append `!` to refresh local cache
        " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
        "
        " see :h vundle for more details or wiki for FAQ
        " Put your non-Plugin stuff after this line
    endif
" Vundelzeug }}}

set encoding=utf8
set backspace=2
syn on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
nnoremap Q @q
set number relativenumber

" autocmd CmdwinEnter * nnoremap <CR> <CR>
" autocmd BufReadPost quickfix nnoremap <CR> <CR>

" CR stuff {{{
    nnoremap <CR> o<ESC>
    nnoremap <C-J> a<CR><ESC>k$
    nnoremap <C-CR> <C-]>
" CR stuff }}}

" GUI stuff {{{
    set guifont=Consolas:h10:cANSI:qDRAFT
    inoremap <S-CR> <CR><C-O><BS>
    nnoremap <S-CR> O<ESC>
" GUI stuff }}}


" extra mouse key goes backwards
nnoremap <X1Mouse> <C-O>

" yank and delete stuff {{{
    " Y yanks the rest of the line, which is more logic to me
    nnoremap Y y$
    " DD deletes hole line without linebreak
    nnoremap DD ^d$
    " delete hole line but yank without linebreak
    nnoremap DDD ^d$"_dd
    
    " YY yanks complete line without linebreak
    function! s:YankLine()
        let view = winsaveview()
        normal! ^y$
        call winrestview(view)
    endf
    nnoremap YY :<c-u>call <SID>YankLine()<cr>

" yank and delete stuff }}}

let mapleader=" "

" open a link
nnoremap <leader><CR><CR> <C-]>

" vim: fdm=marker:
