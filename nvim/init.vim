"Install vim plug using the command below
"curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ntpeters/vim-better-whitespace'


" Nice status bar
Plug 'bling/vim-airline'

" Auto close parens, braces, brackets, etc
Plug 'jiangmiao/auto-pairs'


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'ctrlpvim/ctrlp.vim'

"From: https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
"let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
"let g:ctrlp_use_caching = 0
noremap <C-p>       :Files<CR>


" Colours
Plug 'NLKNguyen/papercolor-theme'
Plug 'lifepillar/vim-solarized8'

"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline-themes'

Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/limelight.vim'
Plug 'nathanaelkane/vim-indent-guides'


" Initialize plugin system
call plug#end()


let mapleader = ","

cmap Wq wq


map <C-p>       :Files<CR>



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
set hidden
set mouse=a

set clipboard=unnamed
"set backspace=2




"imap <S-Insert> "*pa

"nnoremap <S-Insert> "*p
"
"nnoremap <C-Insert> "+p<cr>
"nnoremap <C-Insert> "+p<cr>
imap <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
cmap <S-Insert> <MiddleMouse>

noremap <C-Left>    :tabprev<CR>
noremap <C-Right>   :tabnext<CR>




:tnoremap <Esc> <C-\><C-n>

set background=light
colorscheme  PaperColor
"colorscheme  solarized8

autocmd TermOpen,BufEnter,BufNew term://* startinsert
"Limit the scroll to 20K lines
autocmd TermOpen term://* set scrollback=20000

" remember the last position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 


cabbr t buffer term://<Tab>


" Make sure that cursor is visible when we do an escape in terminal
" http://vimcasts.org/episodes/neovim-terminal-paste/
hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE

