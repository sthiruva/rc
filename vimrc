set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'https://github.com/kien/ctrlp.vim.git'

Bundle 'ntpeters/vim-better-whitespace'
Bundle 'altercation/vim-colors-solarized'
Bundle 'desert-warm-256'


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



" These are my extensions
if exists("$BLITZ_ROOT")
    source $BLITZ_ROOT/etc/dotvimrc
endif

filetype on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab 
set hlsearch
set incsearch
set ignorecase
set smartcase
set wildmode=longest,list,full
set wildmenu
set autowrite
set autoindent

"Don't really like highlighted parenthesis matching, so this disables it
let loaded_matchparen = 1

" Interpret SConstruct files python files
au BufNewFile,BufRead SCons* set filetype=python

"maps for opening partners of (, {, ", '
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i

inoremap <C-l> <Esc>la
inoremap <C-h> <Esc>i

"Search for tag file..here and above!
set tags=./tags;

" open the tags
"map <C-]> :tab split<CR>:exec("tselect ".expand("<cword>"))<CR>
map <C-]> :exec("tselect ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tselect ".expand("<cword>"))<CR>


" Setting for asciidoc files
autocmd BufRead,BufNewFile *.txt,*.asciidoc,*.adoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc spell
        \ textwidth=70 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
