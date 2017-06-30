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
Plugin 'https://github.com/vim-scripts/ShowMarks.git'

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
if exists("$STING_ROOT")
    source $STING_ROOT/etc/dotvimrc
endif

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
"set backspace=2
set backspace=indent,eol,start " backspace over everything in insert mode

syntax on

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

autocmd VimEnter * map <C-p> :CtrlPMixed

"Search for tag file..here and above!
set tags=./tags;

" open the tags
"map <C-]> :tab split<CR>:exec("tselect ".expand("<cword>"))<CR>
map <C-]> :exec("tselect ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tselect ".expand("<cword>"))<CR>

set textwidth=80 wrap
"set colorcolumn=80
set formatoptions=tcqnr
set nospell

"croql


" Setting for asciidoc files
autocmd BufRead,BufNewFile *.txt,*.asciidoc,*.adoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc spell
        \ textwidth=80 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

noremap <M-Right> :tabnext
noremap <M-Left>  :tabprev


inoremap <M-Right> <Esc>:tabnext
inoremap <M-Left>  <Esc>:tabprev


noremap <A-1> :tabn 1<CR>
noremap <A-2> :tabn 2<CR>
noremap <A-3> :tabn 3<CR>
noremap <A-4> :tabn 4<CR>
noremap <A-5> :tabn 5<CR>
noremap <A-6> :tabn 6<CR>
noremap <A-7> :tabn 7<CR>
noremap <A-8> :tabn 8<CR>
noremap <A-9> :tabn 9<CR>

