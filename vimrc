" Install plug with command in a terminal: 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')



Plug 'ntpeters/vim-better-whitespace'


" Nice status bar
Plug 'bling/vim-airline'

"Plug 'ctrlpvim/ctrlp.vim'

"From: https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
"let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
"let g:ctrlp_use_caching = 0
"noremap <C-p>       :CtrlPMixed<CR>


Plug 'NLKNguyen/papercolor-theme'
Plug 'lifepillar/vim-solarized8'

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline-themes'

Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/limelight.vim'
Plug 'nathanaelkane/vim-indent-guides'





" Initialize plugin system
call plug#end()


map <C-p>       :Files<CR>


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

set autoindent
set ruler
set number
set splitright
set splitbelow
set nowrap

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


noremap <C-Left>    :tabprev<CR>
noremap <C-Right>   :tabnext<CR>
"noremap <C-p>       :CtrlPMixed<CR>

noremap <A-0> :tabn 0
noremap <A-1> :tabn 1
noremap <A-2> :tabn 2
noremap <A-3> :tabn 3
noremap <A-4> :tabn 4
noremap <A-5> :tabn 5
noremap <A-6> :tabn 6
noremap <A-7> :tabn 7

"autocmd VimEnter * map <C-p> :CtrlPMixed

"Search for tag file..here and above!
set tags=./tags;

" open the tags
"map <C-]> :tab split<CR>:exec("tselect ".expand("<cword>"))<CR>
map <C-]> :exec("tselect ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tselect ".expand("<cword>"))<CR>

"set textwidth=80 wrap
"set colorcolumn=80
set formatoptions=tcqnr
set nospell

set hidden

"croql


" Setting for asciidoc files
autocmd BufRead,BufNewFile *.txt,*.asciidoc,*.adoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc spell
        \ textwidth=80 wrap formatoptions=tcqnrbl
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<c-t>'],
"    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"    \ }
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

"noremap <C-S-c> "+y
"noremap <C-S-p> "+gP


set background=light
"colorscheme  PaperColor
"colorscheme  lettuce
"colorscheme BlackSea
colorscheme visualstudio

let g:indent_guides_enable_on_vim_startup = 1

:tnoremap <Esc> <C-\><C-n>

"autocmd VimEnter * NERDTree

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
