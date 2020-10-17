call plug#begin('~/vimfiles/plugged')

Plug 'junegunn/vim-plug'

"Plug 'Shougo/vimproc'

"Plug 'thinca/vim-quickrun'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
"Plug 'Shougo/deol.nvim'
Plug 'vim-syntastic/syntastic'

Plug 'Shougo/unite.vim'
Plug 'ujihisa/unite-colorscheme'
Plug 'rafi/awesome-vim-colorschemes'
"Plug 'flazz/vim-colorschemes'
"Plug 'haishanh/night-owl.vim'

Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'PProvost/vim-ps1'
Plug 'ElmCast/elm-vim'
"Plug 'fsharp/vim-fsharp', {
"      \ 'for': 'fsharp',
"      \ 'do':  'make fsautocomplete',
"      \}


call plug#end()

"language C
filetype plugin indent on
syntax enable

set background=dark

set encoding=utf-8
set termencoding=utf-8
scriptencoding=utf-8
set fileencoding=utf-8
let $LANG='ja_JP.UTF-8'

set ambiwidth=double
set showcmd
set listchars=tab:^\ ,trail:_,extends:>,precedes:<
set visualbell t_vb=
set statusline=%<\ %n\ %t\ %m\ %r%h%w%=\ \|\ %{&fenc!=''?&fenc:&enc}\ %{&ff}\ %{&filetype}\ \|\ %l/%LL\ %2vC\ %3p%%
set rulerformat=%40(%=%t%h%m%r%w%<\ (%n)\ %4.7l,%-7.(%c%V%)\ %P%)
set display=lastline
set cmdheight=1
set laststatus=2
"set showtabline=2
set title
set shortmess& shortmess+=I
set ignorecase smartcase incsearch hlsearch grepprg=internal
set shiftwidth=2 tabstop=2 autoindent copyindent preserveindent
set expandtab
set autoread
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set formatoptions& formatoptions+=mM formatoptions-=r formatoptions-=o
set formatexpr=autofmt#japanese#formatexpr()
set scrolloff=3
set nostartofline
set sidescroll=1 sidescrolloff=1
set modeline
set complete& complete+=k
set completeopt& completeopt+=menuone completeopt-=preview
set infercase
set wildmenu
set wildmode=longest,full
set history=1000
set timeoutlen=5000
set hidden
set keywordprg=:help
set nowritebackup
set nobackup
set noswapfile
set noundofile
set winminheight=0
set matchtime=1
set clipboard=unnamed,autoselect
set virtualedit& virtualedit+=block
set helpheight=10
set pumheight=10
"set imdisable
set iminsert=0
set imsearch=-1
"set termwinsize=7x0

if has('viminfo')
  set viminfo='500,<500,s50,h,rA:,rB:
end

if has('win32')
  "set shell=pwsh
  set shell=bash
  "set shell=C:\msys64\msys2_shell.cmd
  
  "set shellcmdflag=-login
  "set shellquote=\"
  "set shellxquote=
endif

function BufNextWithoutTerm()
  bnext 
  if matchstr(bufname("%"), 'cmd') == 'cmd' || matchstr(bufname("%"), 'bash') == 'bash'
    bnext
  end
endfunction

function BufPrevWithoutTerm()
  bprevious
  if matchstr(bufname("%"), 'cmd') == 'cmd' || matchstr(bufname("%"), 'bash') == 'bash'
    bprevious
  end
endfunction

function BufDelWithoutWin()
  call BufNextWithoutTerm()
  try
    bd #
  catch
    call BufPrevWithoutTerm() 
    echoerr v:exception
  endtry
endfunction

function Term()
  term
  15wincmd-
endfunction

command! Term call Term()


let mapleader = "\<Space>"

noremap <Leader>l :tabnext <CR>
noremap <Leader>h :tabprevious <CR>
noremap <Leader>j :call BufNextWithoutTerm()<CR>
noremap <Leader>k :call BufPrevWithoutTerm()<CR>
noremap <Leader>d :call BufDelWithoutWin()<CR>
noremap <Leader>r a<C-r>=

nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap <C-c> <ESC>
nnoremap <silent> <C-c><C-c> :nohlsearch<CR>
nnoremap * *N

inoremap <F2> <C-R>=strftime("%Y_%m_%d")<CR>
inoremap <C-v> <C-R>"
"inoremap <C-b> <Left>
"inoremap <C-f> <Right>
"inoremap <C-n> <Down>
"inoremap <C-p> <Up>
"inoremap <C-d> <Del>
"inoremap <C-a> <Home>
"inoremap <C-e> <End>

vnoremap ; :

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-v> <C-R>"
cnoremap <F2> <C-R>=strftime("%Y_%m_%d")<CR>

tnoremap <F1> <C-c>
tnoremap <C-c> <C-w>N
"tnoremap <ESC> <C-w>N
tnoremap <C-v> <C-w>"0
tnoremap <C-f> <Right>
tnoremap <C-b> <Left>
tnoremap <C-p> <Up>
tnoremap <C-n> <Down>
tnoremap <C-a> <Home>
tnoremap <C-e> <End>
tnoremap <C-d> <Delete>
tnoremap <C-h> <BS>

" Terminal
"autocmd TerminalOpen * wincmd J | 10wincmd -

" F#
autocmd BufNewFile,BufRead *.fs,*.fsi,*.fsx set filetype=fsharp

" Rust
let g:rustfmt_autosave = 1

" Unite colorscheme
let g:unite_colorscheme_blacklist = [ 
\ "broduo","brogrammer","brookstream",
\ "bubblegum","bubblegum-256-dark","bubblegum-256-light",
\ "crunchbang", "greygull",
\ "flattened_dark", "flattened_light",
\ "parsec"
\ ]

"" QuickRun
let g:quickrun_config = {
\ "_" : {
\   "runner" : "job",
\   "runner/vimproc/updatetime" : 10,
\   "outputter/buffer/split" : "botright 5sp",
\   "outputter/buffer/close_on_empty" : 1,
\   },
\ "python" : {
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "sjis",
\   },
\ "ps1" : {
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "cp932",
\   },
\ "haskell": { "type": "haskell/stack" },
\ "haskell/stack": {
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "cp932",
\   "command": "stack",
\   "cmdopt": "runghc"
\   },
\ "fsharp": {
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "cp932",
\   "command": "dotnet",
\   "cmdopt": "run",
\   },
\ "rust": {
\   "hook/output_encode/enable" : 1,
\   "hook/output_encode/encoding" : "cp932",
\   'exec': ['%c %o %s', '%s:p:r %a'],
\   'tempfile': 'tmp.rs',
\   'hook/sweep/files': ['%S:p:r', '%S:p:r.pdb', '%S:p:r.exe', 'tmp.pdb' ,'tmp.exe'],
\   "cmdopt": "-A unused",
\   "watchdogs_checker": {
\	    "type" : "watchdogs_checker/rust",
\     "cmdopt": "-A unused"
\     }
\   }
\ }
