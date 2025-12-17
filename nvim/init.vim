
call plug#begin('~/vimfiles/plugged')
Plug 'junegunn/vim-plug'
Plug 'scrooloose/nerdtree'
Plug 'w0ng/vim-hybrid'
Plug 'isRuslan/vim-es6'
Plug 'leafgarland/typescript-vim'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'PProvost/vim-ps1'
Plug 'ElmCast/elm-vim'
Plug 'ziglang/zig.vim'
Plug 'rust-lang/rust.vim'
call plug#end()


let g:zig_fmt_autosave = 0


color hybrid


scriptencoding=utf-8
set fileencoding=utf-8
let $LANG='ja_JP.UTF-8'

set ambiwidth=double
set listchars=multispace:\ ,tab:^\ ,trail:_,extends:>,precedes:<
set visualbell t_vb=
set statusline=%<\ %n\ %t\ %m\ %r%h%w%=\ \|\ %{&fenc!=''?&fenc:&enc}\ %{&ff}\ %{&filetype}\ \|\ %l/%LL\ %2vC\ %3p%%
set rulerformat=%40(%=%t%h%m%r%w%<\ (%n)\ %4.7l,%-7.(%c%V%)\ %P%)
set cmdheight=1
"set showtabline=2
set title
set shortmess& shortmess+=I
set magic ignorecase smartcase grepprg=internal
set shiftwidth=2 tabstop=2 copyindent preserveindent
set expandtab
set whichwrap=b,s,<,>,[,]
set formatoptions& formatoptions+=mM formatoptions-=r formatoptions-=o
set formatexpr=autofmt#japanese#formatexpr()
set scrolloff=3
set sidescrolloff=1
set modeline
set complete& complete+=k
set completeopt& completeopt+=menuone completeopt-=preview
set infercase
set wildmode=longest,full
set timeoutlen=5000
set keywordprg=:help
set nowritebackup
set nobackup
set noswapfile
set noundofile
set winminheight=0
set matchtime=1
set clipboard+=unnamedplus
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
  "set shell=pwsh

  " zenhan. https://github.com/iuchim/zenhan
  "function IMEToggle(bool)
  "  if a:bool
  "    "call system(["zenhan", g:ime_state])
  "  else
  "    "let g:ime_state = system(["zenhan"])
  "    call system(["zenhan", 0])
  "  endif
  "endfunction

  "augroup IMEToggle
  "  autocmd!
  "  autocmd InsertEnter * call IMEToggle(v:true)
  "  autocmd InsertLeave * call IMEToggle(v:false)
  "augroup END
endif


let mapleader = "\<Space>"

noremap <Leader>l :tabnext<CR>
noremap <Leader>h :tabprevious<CR>
noremap <Leader>j :bnext<CR>
noremap <Leader>k :bprevious<CR>
noremap <Leader>r o<C-r>=
noremap <Leader>y "zy
noremap <Leader>p "zp
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
"nnoremap <tab>   <c-w>w
"nnoremap <S-tab> <c-w>W
nnoremap <tab>   :tabnext<CR>                  
nnoremap <S-tab> :tabprevious<CR> 

nnoremap ; :
nnoremap : ;
nnoremap j gj
nnoremap k gk
nnoremap <C-c> <ESC>
nnoremap <silent> <C-c><C-c> :nohlsearch<CR>
nnoremap * *N

inoremap <C-c> <ESC>
inoremap <F2> <C-R>=strftime("%Y_%m_%d")<CR>
inoremap <C-v> <C-R>"
inoremap <C-a> <Home>
inoremap <C-e> <End>


vnoremap ; :
vnoremap <Leader>y "zy

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


augroup VimrcReload 
  autocmd!
  autocmd BufWritePost  $MYVIMRC so $MYVIMRC
augroup END


command! ReplaceDoubleWidthSpace execute ":%s/　/ /g"

command! PSLedgerCalc call PSLedgerCalc()
function PSLedgerCalc()
  let l:dir = expand("%:h")
  let l:file = expand("%:f")
  execute "cd " . l:dir
  echo system(["pwsh", l:dir."/Calc.ps1", l:file])
endfunction


command! BlogNew call BlogNew()
command! BlogUpload call BlogUpload()
augroup Blog
  autocmd!
  autocmd BufWritePost $HOME/Github/kmtoki.github.io/content/blog/*.md call BlogUpload()
augroup END

function BlogNew()
  let l:dir = $HOME . "\\Github\\kmtoki.github.io"
  let l:file = strftime("content\\blog\\%Y_%m_%d_%H_%M.md")
  let l:header = "---\ndate: " . strftime("%Y-%m-%d %H:%M:%S") . "\ntitle: \ntags: \n---\n"
  let g:blog_md = l:dir . "\\" . l:file
  execute "cd " . l:dir
  execute "e " . l:file
  execute ":normal i" . l:header
endfunction

function BlogUpload()
  let l:cmd = "git add " . g:blog_md . " && git commit -m \"new md\" && git push && node script/hatenaPost.js " . g:blog_md
  echo l:cmd
  echo system(l:cmd)
endfunction

command! BlogInsertElapsedTimeTextSize call BlogInsertElapsedTimeTextSize()
function BlogInsertElapsedTimeTextSize()
  let l:time = matchstr(getline(2), '\d\+:\d\+')
  let l:ts = split(time, ":")
  let l:birth = str2nr(l:ts[0]) * 60 + str2nr(l:ts[1])
  let l:ts = split(strftime("%X", localtime()), ":")
  let l:now = str2nr(l:ts[0]) * 60 + str2nr(l:ts[1])
  let l:size = GetTotalUtf8CharCount()
  let l:info = printf("（%d分、 %d文字）", (l:now - l:birth), l:size)
  execute ":normal i" . l:info
endfunction

function! GetTotalUtf8CharCount()
  let total_chars = 0
  let num_lines = line('$')

  for i in range(1, num_lines)
    let line_content = getline(i)
    let total_chars += strchars(line_content)
  endfor

  return total_chars
endfunction
