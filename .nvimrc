"""" init neovim

""" Plug 
call plug#begin('~/.config/nvim/plugged')

"" Requires
Plug 'junegunn/vim-plug'
Plug 'Shougo/vimproc'
Plug 'thinca/vim-quickrun'
Plug 'itchyny/lightline.vim'

"" Colors
Plug 'w0ng/vim-hybrid'
Plug 'croaker/mustang-vim'
Plug 'morhetz/gruvbox'

"" Languages
" Rust
Plug 'rust-lang/rust.vim'
Plug 'rhysd/rust-doc.vim'

" TOML
Plug 'cespare/vim-toml'

" Swift
Plug 'keith/swift.vim'

" LLVM IR
"Plug 'Superbil/llvm.vim'

call plug#end()


""" Sets
set hidden
set noswapfile
set smartindent "C-like indent
set ignorecase
set smartcase "set noignorecase if search pattern has upper case
set infercase "in insert completion too
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab "insert space instead tab
set clipboard=unnamed
set virtualedit=block "allow virtual edit in visual block mode
set ambiwidth=double "use twice width char
set scrolloff=3
set helpheight=10
set pumheight=10
set winminheight=0
set imdisable
set statusline=%<\ %n\ %t\ %m\ %r%h%w%=\ \|\ %{&fenc!=''?&fenc:&enc}\ %{&ff}\ %{&filetype}\ \|\ %l/%LL\ %2vC\ %3p%%
set ruler
set rulerformat=%40(%=%t%h%m%r%w%<\ (%n)\ %4.7l,%-7.(%c%V%)\ %P%)
set belloff=all

""" Maps
nnoremap <C-c> <ESC>
nnoremap <silent> <C-c><C-c> :nohlsearch<CR>

cnoremap <C-a> <C-b>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>

""" Colors
set background=dark
colorscheme hybrid

"let g:gruvbox_contrast_dark='soft'
"colorscheme gruvbox

hi Search cterm=NONE ctermfg=NONE ctermbg=237
"hi Visual cterm=NONE ctermfg=black ctermbg=237

"hi Pmenu      ctermfg=white ctermbg=darkgray
"hi PmenuSel   ctermfg=white ctermbg=darkblue
"hi PmenuThumb ctermbg=darkblue
"hi PmenuSbar  ctermbg=gray

""" Plugins
"" lightline
let g:lightline = {
\ 'colorscheme': 'concise',
\ 'component': { 'readonly': "%{ &readonly ? '' : '' }" },
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '', 'right': '' }
\ }

command! -nargs=1 -complete=custom,ListLLCS LightlineColorscheme 
\ let g:lightline.colorscheme = <q-args>
\ | call lightline#init()
\ | call lightline#colorscheme()
\ | call lightline#update()

function! ListLLCS(A,L,P)
return system("ls $HOME/.config/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/ | perl -pe 's/(.+)\.vim/$1/' ")
endfunction

"" QuickRun
let g:quickrun_config = {
\ "_" : {
\   "runner" : "vimproc",
\   "runner/vimproc/updatetime" : 10,
\   "outputter/buffer/split" : "botright 5sp",
\   "outputter/buffer/close_on_empty" : 1
\   },
\ "haskell": { "type": "haskell/stack" },
\ "haskell/stack": {
\   "command": "stack",
\   "exec": "%c %o %s %a",
\   "cmdopt": "runghc"
\   }
\ }

nnoremap <Leader>c :call quickrun#sweep_sessions()<CR>

"" Rust
let g:rust_recommended_style = 0

"" LLVM
augroup filetype
au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END

augroup filetype
au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

"" Go
autocmd FileType go :highlight goErr ctermfg=red
autocmd FileType go :match goErr /\<[eE]rr\>/
