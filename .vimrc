
call plug#begin('~/vimfiles/plugged')

Plug 'junegunn/vim-plug'

Plug 'scrooloose/nerdtree'

"Plug 'vim-denops/denops.vim'
"Plug 'Shougo/ddc.vim'
"Plug 'Shougo/ddx.vim'

Plug 'w0ng/vim-hybrid'

Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'PProvost/vim-ps1'
Plug 'ElmCast/elm-vim'


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
set magic ignorecase smartcase incsearch hlsearch grepprg=internal
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
set iminsert=0
set imsearch=-1
set noshelltemp

if has('viminfo')
  set viminfo='500,<500,s50,h,rA:,rB:
end

if has('win32')
  set shell=pwsh
endif

let mapleader = "\<Space>"

noremap <Leader>l :tabnext <CR>
noremap <Leader>h :tabprevious <CR>
noremap <Leader>j :bnext<CR>
noremap <Leader>k :bprevious<CR>
noremap <Leader>r a<C-r>=
noremap <Leader>y "zy
noremap <Leader>p "zp
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
"nnoremap <tab>   <c-w>w
"nnoremap <S-tab> <c-w>W

nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap <C-c> <ESC>
nnoremap <silent> <C-c><C-c> :nohlsearch<CR>
nnoremap * *N

inoremap <F2> <C-R>=strftime("%Y_%m_%d")<CR>
inoremap <C-v> <C-R>"
inoremap <C-a> <Home>
inoremap <C-e> <End>

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

tnoremap <F12> <C-c>
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

" Vimrc
augroup VimrcReload 
  autocmd!
  autocmd BufWritePost  ~/.vimrc  so ~/.vimrc
  autocmd BufWritePost  ~/.gvimrc  so ~/.gvimrc
augroup END

" Blog 
command! BlogNew call BlogNew()
augroup Blog
  autocmd!
  autocmd BufWritePost $HOME/Github/blog/md/*.md call BlogUpload()
augroup END

function BlogNew()
  let l:dir = $HOME . "\\Github\\blog"
  let l:file = strftime("md\\%Y_%m_%d_%H_%M.md")
  let l:header = "---\ndate: " . strftime("%Y/%m/%d %H:%M") . "\ntitle: \ncategory: \n---\n"
  let g:blog_md = l:dir . "\\" . l:file
  execute "cd " . l:dir
  execute "e " . l:file
  execute ":normal i" . l:header
endfunction

function BlogUpload()
  let l:cmd = "git add " . g:blog_md . " && git commit -m 'new md' && git push && node md/hatenaPost.js " . g:blog_md
  echo system(l:cmd)
endfunction
