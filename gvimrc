"set guifont=MiscFixed\ Semi-Condensed\ 13
"set guifont=MiscFixed\ Semi-Condensed\ 13
"set guifont=Consolas\ 11
"set guifont=DejaVu\ Sans\ Mono\ 10

"set guifont=ProggyCleanTT\ CE\ 12
set  guifont=Ubuntu\ Mono\ 11



"set bg=light


"set cursorline

"set guifont=Ubuntu\ Mono\ 13


"winpos 250 30
"winsize 120 58

imap <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

set guioptions=aegimt

set mousemodel=popup

"":IndentGuidesEnable

set guioptions-=T " remove toolbar
set guioptions-=r " remove toolbar

hi ExtraWhitespace guibg=#A4A4E4

" highlight only comments
""set background=dark
""highlight clear
"if exists("syntax_on")
"    syntax reset
"endif

"let colors_name = "comments"

" First set Normal to regular white on black text colors:
"hi Normal ctermfg=LightGray ctermbg=Black guifg=#dddddd	guibg=Black

hi Normal ctermfg=Black ctermbg=White guifg=Black	guibg=White

" Syntax highlighting (other color-groups using default, see :help group-name):
"hi Comment    cterm=NONE ctermfg=08     guifg=#555555
"hi Constant   cterm=NONE ctermfg=Black  guifg=Black  
"hi Identifier cterm=NONE ctermfg=Black  guifg=Black  
"hi Function   cterm=NONE ctermfg=Black  guifg=Black  
"hi Statement  cterm=NONE ctermfg=Black  guifg=Black  
"hi PreProc    cterm=NONE ctermfg=Black  guifg=Black  
"hi Type	      cterm=NONE ctermfg=Black  guifg=Black  
"hi Special    cterm=NONE ctermfg=Black  guifg=Black  
"hi Delimiter  cterm=NONE ctermfg=Black  guifg=Black  
"hi Operator   cterm=NONE ctermfg=Black  guifg=Black  


colorscheme BlackSea
