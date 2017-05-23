"""" init neovim

""" Plug 
call plug#begin('~/.config/nvim/plugged')

"" Requires
Plug 'junegunn/vim-plug'
Plug 'Shougo/vimproc'
Plug 'thinca/vim-quickrun'
Plug 'itchyny/lightline.vim'
Plug 'kmtoki/lightline-colorscheme-simplicity'
Plug 'rhysd/clever-f.vim'

"" Colors
Plug 'w0ng/vim-hybrid'
Plug 'croaker/mustang-vim'
Plug 'romainl/Apprentice'
Plug 'AlessandroYorba/Alduin'
Plug 'dracula/vim'
Plug 'AlessandroYorba/Sidonia'

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

" Eve
Plug 'frankier/vim-eve'

" Fish
Plug 'dag/vim-fish'

" Nim
Plug 'baabelfish/nvim-nim'

" Arduino
Plug 'sudar/vim-arduino-syntax'

" Haskell
"Plug 'neovimhaskell/haskell-vim'

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
nnoremap ; :
nnoremap : ;
nnoremap <C-c> <ESC>
nnoremap <silent> <C-c><C-c> :nohlsearch<CR>
nnoremap * *N

cnoremap <C-a> <C-b>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>

nnoremap <M-^> :bn<CR>

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
\ 'colorscheme': 'simplicity',
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
\   },
\ "rust": {
\   "cmdopt": "-A unused",
\   }
\ }

nnoremap <Leader>c :call quickrun#sweep_sessions()<CR>

"" Rust
let g:rust_recommended_style = 0
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
au BufRead,BufNewFile *.rs set filetype=rust
""au BufRead,BufNewFile *.rs set tabstop=4
""au BufRead,BufNewFile *.rs set shiftwidth=4
""au BufRead,BufNewFile *.rs set softtabstop=4

"" LLVM
au BufRead,BufNewFile *.ll set filetype=llvm

au BufRead,BufNewFile *.td set filetype=tablegen

"" Go
au FileType go :highlight goErr ctermfg=red
au FileType go :match goErr /\<[eE]rr\>/

"" Ruby
au BufRead,BufNewFile *.gemspecs set filetype=ruby
au BufRead,BufNewFile RakeFile set filetype=ruby
au BufRead,BufNewFile Gemfile set filetype=ruby

"" Lisp
au FileType lisp set nocindent
au FileType lisp set lisp
au FileType lisp set lispwords=
