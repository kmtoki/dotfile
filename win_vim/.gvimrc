set guifont=Ricty_Diminished:h18:cSHIFTJIS
"set guifont=HackGenNerd:h18:cSHIFTJIS
set guioptions=M
set background=dark
set visualbell t_vb=
set cmdheight=1

set lines=60
set columns=120

"winpos 850 0
winpos 1670 0

"au GUIEnter * FullScreen
"au GUIEnter * set transparency=220
"au GUIEnter * hi Normal guifg=white guibg=black
au GUIEnter * hi Normal guibg=#151515

"colorscheme one 

function OceanicNext()
  color OceanicNext
  hi Normal guifg=white guibg=black
  hi EndOfBuffer guifg=gray guibg=black
  hi Statement gui=NONE
  hi Type gui=NONE
  hi link rustCommentLine Comment
  hi link rustCommentBlock Comment
endfunction

"command! Dev call Dev()
command! OceanicNext call OceanicNext()

call OceanicNext()
