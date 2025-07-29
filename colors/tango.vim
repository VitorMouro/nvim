" Vim color file
" Author: Taylon Silmer <taylonsilva@gmail.com>
" Version: 0.1
set background=light
highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "tango"

" if exists("g:bg_tango") && g:bg_tango == 1
"     highlight Normal gui=none guifg=#2e3436 guibg=#ffffff
" else
"     highlight Normal gui=none guifg=#2e3436 guibg=#ffffff
" endif

highlight Normal gui=none guifg=#2e3436 guibg=#ffffff

" Search
highlight IncSearch gui=underline guifg=#555753 guibg=#fce94f
highlight Search gui=none guifg=#555753 guibg=#fce94f

" Messages
highlight ErrorMsg gui=bold guifg=#ffffff guibg=#cc0000
highlight WarningMsg gui=bold guifg=#ffffff guibg=#cc0000
highlight ModeMsg gui=bold guifg=#2e3436 guibg=bg
highlight MoreMsg gui=none guifg=#204a87 guibg=bg
highlight Question gui=none guifg=#4e9a06 guibg=bg

" Split area
highlight StatusLine gui=none guifg=#ffffff guibg=#3465a4
highlight StatusLineNC gui=none guifg=#ffffff guibg=#729fcf
highlight VertSplit gui=none guifg=#d3d7cf guibg=#204a87
highlight WildMenu gui=none guifg=#2e3436 guibg=#ffffff

" Diff
highlight DiffText gui=bold guifg=#2e3436 guibg=#ad7fa8
highlight DiffChange gui=none guifg=bg guibg=#ad7fa8
highlight DiffDelete gui=none guifg=bg guibg=#ffffff
highlight DiffAdd gui=none guifg=#3465a4 guibg=#ffffff

" Cursor
highlight Cursor gui=none guifg=#ffffff guibg=#729fcf
highlight MatchParen gui=bold guifg=#ffffff guibg=#ce5c00

" Fold
highlight Folded gui=none guifg=#555753 guibg=#ffffff
highlight FoldColumn gui=none guifg=#888a85 guibg=#ffffff

" Popup Menu
highlight PMenu guifg=#ffffff guibg=#555753
highlight PMenuSel guifg=#2e3436 guibg=#ffffff
highlight PMenuSBar guifg=#2e3436 guibg=#ffffff
highlight PMenuThumb guifg=#2e3436 guibg=#ffffff

" Other
highlight Directory gui=none guifg=#204a87 guibg=bg
highlight LineNr gui=none guifg=#888a85 guibg=#ffffff
highlight NonText gui=none guifg=#555753 guibg=#ffffff
highlight SpecialKey gui=none guifg=#75507b guibg=bg
highlight Title gui=bold guifg=#3465a4 guibg=bg
highlight Visual gui=none guifg=#555753 guibg=#ffffff

" Syntax group
highlight Comment gui=none guifg=#888a85 guibg=bg
highlight Constant gui=bold guifg=#cc0000 guibg=bg
highlight Error gui=none guifg=#a40000 guibg=#cc0000
highlight SpellBad term=underline gui=undercurl guisp=#ef2929
highlight Identifier gui=none guifg=#3465a4 guibg=bg
highlight Ignore gui=none guifg=bg guibg=bg
highlight PreProc gui=none guifg=#75507b guibg=bg
highlight Special gui=none guifg=#75507b guibg=bg
highlight Statement gui=none guifg=#c4a000 guibg=bg
highlight Todo gui=bold guifg=#ef2929 guibg=bg
highlight Type gui=none guifg=#4e9a06 guibg=bg
highlight Underlined gui=none guifg=#3465a4 guibg=bg
highlight String gui=none guifg=#a40000 guibg=bg
highlight Number gui=none guifg=#3465a4 guibg=bg
