set aw
"set guicursor=a:blinkon0
set ruler
set laststatus=2
"these are extra additions
set nocompatible
syntax on
set hlsearch
set incsearch
set expandtab 
set tabstop=4
set ignorecase
set shiftwidth=4

set smarttab 
set smartcase
set bs=2
set bg=dark
set scrolloff=3


"Don't really like highlighted parenthesis matching, so this disables it
let loaded_matchparen = 1


:if &term == "rxvt"
:  set t_kb=
:  fixdel
:endif

"add for syntax highliting

"au BufRead,BufNewFile *.lisa set filetype=lisa 
"au! Syntax newlang source ~/.vim/syntax/newlanguage.vim
"

au BufNewFile,BufRead SCons* set filetype=python



map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set tags=./tags;
set tags+=~/.vim/tags/cpp





"This will remember the places that we have been . This is called as the jump list.
if has("autocmd")
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif " has("autocmd")

"maps


"set makeprg=/home/shathi01/bin/bin/build.sh

"map <S-Insert> "*p
"map! <S-Insert> "*pi  

"set guicursor=a:blinkon0


"some useful maps
map  :bn
map  :bp  
map <C-Right> :tabNext 
map <C-Left>  :tabprevious 

"Alt + 1 for 1st tab, Alt + 2 for second tab
map ±  :tabn 1 
map ²  :tabn 2 
map ³  :tabn 3 
map ´  :tabn 4 
map µ  :tabn 5 
map ¶  :tabn 6 
map ·  :tabn 7 



"map  :tabnew 

imap <C-Del> ldwi
map  <C-Del> dw

map  <F2> :FufCoverageFile 

imap <C-Space> 

"maps for opening partners of (, {, ", '
inoremap { {}<Esc>i<CR><Esc>O
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i

"Some maps to help us move freely
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-k> <Esc>ka
inoremap <C-j> <Esc>ja
inoremap <C-h> <Esc>ha
inoremap <C-l> <Esc>la




filetype on
filetype indent on
filetype plugin on


" some things that are useful for build
set makeprg=scons
set shell=/bin/bash 

function! s:build()
    cd $WORKDIR
    make
    cd -
endfunction


command! -nargs=0 -bar B call s:build()
command! -nargs=0 -bar C call s:ctmodel()


"au BufWinLeave * mkview                      " saves the folds on quit!
"au BufWinEnter * silent loadview             " loads the folds on opening a file
"

" get rid of beep and visual beep
":set vb t_vb=

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

set nocp
" OmniCppComplete for c++ with OmniCppComplete 
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview
set completeopt=menuone,menu,longest


"set spell

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


autocmd BufNewFile,BufRead  svn-commit.* setf svn
autocmd FileType svn map <Leader>sd :SVNCommitDiff<CR>


colorscheme wombat
