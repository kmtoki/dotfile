
set guifont=Ricty\ for\ Powerline:h30

set background=dark
colorscheme wombat
"colorscheme mustang
"let g:lightline.colorscheme = 'jellybeans'

let g:lightline.colorscheme = 'wombat'
let g:lightline.separator = { 'left': '⮀', 'right': '⮂' }
let g:lightline.subseparator = { 'left': '⮁', 'right': '⮃' }
call lightline#init()
call lightline#colorscheme()
call lightline#update()

