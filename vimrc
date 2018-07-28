set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


Plugin 'rust-lang/rust.vim'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/jeetsukumaran/vim-buffergator.git'

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
set ruler
set number
set splitright
set splitbelow

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


noremap <C-Left>    :tabprev<CR>
noremap <C-Right>   :tabnext<CR>
noremap <C-p>       :CtrlPMixed<CR>

noremap <A-0> :tabn 0
noremap <A-1> :tabn 1
noremap <A-2> :tabn 2
noremap <A-3> :tabn 3
noremap <A-4> :tabn 4
noremap <A-5> :tabn 5
noremap <A-6> :tabn 6
noremap <A-7> :tabn 7


"Search for tag file..here and above!
set tags=./tags;

" open the tags
"map <C-]> :tab split<CR>:exec("tselect ".expand("<cword>"))<CR>
map <C-]> :exec("tselect ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tselect ".expand("<cword>"))<CR>

set textwidth=80 wrap formatoptions=tcqnrbl
"set spell
set colorcolumn=80
hi ColorColumn ctermbg=7

"set formatoptions=ntcroql

"croql


" Setting for asciidoc files
autocmd BufRead,BufNewFile *.txt,*.asciidoc,*.adoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc spell
        \ textwidth=80 wrap formatoptions=tcqnrbl
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>


let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
