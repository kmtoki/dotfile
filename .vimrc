
""" neobundle

language C

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle'))

let g:neobundle#types#git#default_protocol = 'git'

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim'

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'itchyny/lightline.vim'

"NeoBundle 'kana/vim-smartinput'
NeoBundle 'kana/vim-smartword'
NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'justinmk/vim-dirvish'

"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'thinca/vim-unite-history'
"NeoBundle 'tsukkee/unite-help'
"NeoBundle 'eagletmt/unite-haddock'
"NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
"NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'noahfrederick/Hemisu'
"NeoBundle 'wesgibbs/vim-irblack'
"NeoBundle 'baskerville/bubblegum'
"NeoBundle 'vim-scripts/twilight'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'itchyny/landscape.vim'
"NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'croaker/mustang-vim'
"NeoBundle 'fmoralesc/vim-vitamins'
"NeoBundle 'chriskempson/vim-tomorrow-theme'
"NeoBundle 'flazz/vim-colorschemes'
"NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'cocopon/lightline-hybrid.vim'
"NeoBundle 'cocopon/colorswatch.vim'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle  'jpo/vim-railscasts-theme'
"NeoBundle 'google/vim-colorscheme-primary'
NeoBundle 'sjl/badwolf'
NeoBundle 'freeo/vim-kalisi'

"NeoBundle 'Pychimp/vim-luna'
"
"NeoBundle 'jhenahan/idris-vim'
"NeoBundle 'dart-lang/dart-vim-plugin'
"
NeoBundle 'superbrothers/vim-vimperator'

NeoBundle 'rust-lang/rust.vim'
NeoBundle 'rhysd/rust-doc.vim'
"NeoBundle "cespare/vim-toml"

"NeoBundle 'dag/vim2hs'
"NeoBundle 'eagletmt/ghcmod-vim'
"NeoBundle 'eagletmt/neco-ghc'

NeoBundle 'fatih/vim-go'
NeoBundle 'Blackrush/vim-gocode'

NeoBundle 'keith/swift.vim'

call neobundle#end()

filetype plugin indent on
syntax enable

NeoBundleCheck


""" basic

set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

filetype on

colorscheme default
"set background=dark

set ambiwidth=double
set showcmd
set listchars=tab:^\ ,trail:_,extends:>,precedes:<
set visualbell t_bv=
set display=lastline
set cmdheight=1
set laststatus=2
set statusline=%<\ %n\ %t\ %m\ %r%h%w%=\ \|\ %{&fenc!=''?&fenc:&enc}\ %{&ff}\ %{&filetype}\ \|\ %l/%LL\ %2vC\ %3p%%

set rulerformat=%40(%=%t%h%m%r%w%<\ (%n)\ %4.7l,%-7.(%c%V%)\ %P%)

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

if has('viminfo')
  set viminfo='500,<500,s50,h,rA:,rB:
end

set virtualedit& virtualedit+=block

set helpheight=10

set pumheight=10

set imdisable

""" highlight

hi Visual cterm=NONE ctermfg=white ctermbg=darkblue
hi Search cterm=NONE ctermfg=white ctermbg=darkblue

hi Pmenu ctermfg=white ctermbg=black
hi PmenuSel ctermfg=white ctermbg=darkblue
hi PmenuThumb ctermfg=gray
hi PmenuSbar ctermbg=white

autocmd FileType lisp,scheme :hi Special ctermfg=darkgray

""" keymap

if has('vim_starting')
  mapclear
  mapclear!
end

nnoremap j gj
nnoremap k gk
nnoremap <C-c> <ESC>

nnoremap / g/
nnoremap ? g?

nnoremap * *N

nnoremap Y y$

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap <C-^> :b #<CR>

vnoremap <silent> z/ <Esc>/\v%V
vnoremap <silent> z? <Esc>?\v%V
 
nnoremap <silent> <C-c><C-c> :nohlsearch<CR>

cnoremap <C-a> <C-b>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>

nnoremap Q <Nop>

nnoremap <leader>d "=strftime(" %F %T")<CR>P 

""" Plugin

"" unite
"nnoremap [unite] <Nop>
"nmap <Space> [unite]
"nnoremap <silent> [unite]f  :<C-u>Unite -no-split bookmark file file_mru<CR>
"nnoremap <silent> [unite]d  :<C-u>Unite -no-split bookmark directory directory_mru<CR>
"nnoremap <silent> [unite]F  :<C-u>Unite -no-split file_rec:!<CR>
"nnoremap <silent> [unite]b  :<C-u>Unite -no-split buffer<CR>
"nnoremap <silent> [unite]g  :<C-u>Unite -no-split grep<CR>
"nnoremap <silent> [unite]l  :<C-u>Unite -no-split line<CR>
"nnoremap <silent> [unite]t  :<C-u>Unite -no-split tab<CR>
"nnoremap <silent> [unite]w  :<C-u>Unite -no-split window<CR>
"nnoremap <silent> [unite]hh :<C-u>Unite -no-split -start-insert help<CR>
"nnoremap <silent> [unite]hy :<C-u>Unite -no-split history/yank<CR>
"nnoremap <silent> [unite]hc :<C-u>Unite -no-split history/command<CR>
"nnoremap <silent> [unite]hs :<C-u>Unite -no-split history/search<CR>
"nnoremap <silent> [unite]ha :<C-u>Unite -no-split -start-insert haddock<CR>
"nnoremap <silent> [unite]ho :<C-u>Unite -no-split -start-insert hoogle<CR>
"nnoremap <silent> [unite]r  :<C-U>Unite -no-split register<CR>
"nnoremap <silent> [unite]R  :<C-u>Unite -no-split resume<CR>
"nnoremap <silent> [unite]s  :<C-u>Unite -no-split source<CR>
"nnoremap <silent> [unite]ma :<C-u>Unite -no-split mapping<CR>
"nnoremap <silent> [unite]me :<C-u>Unite -no-split output:message<CR>
"nnoremap <silent> [unite]ac :<C-u>UniteWithCurrentDir -no-split buffer bookmark file<CR>
"nnoremap <silent> [unite]ab :<C-u>UniteWithBufferDir -no-split buffer bookmark file<CR>
"nnoremap <silent> [unite]cs :<C-u>Unite -auto-preview colorscheme<CR>
"
"call unite#custom_default_action('haddock', 'browse_remote')
"call unite#custom_max_candidates('haddock',100)
"call unite#custom_max_candidates('hoogle',100)
"
""let g:unite_enable_start_insert = 1
"let g:unite_source_history_yank_enable = 1
""let g:unite_winheight = 10
"let g:unite_source_file_mru_limit = 100
"let g:unite_source_directory_mru_limit = 100
"let g:unite_source_grep_command = 'ag'
"let g:unite_source_grep_default_opts = '--nocolor --nogroup'
"let g:unite_source_grep_recursive_opt = ''
"let g:unite_source_grep_max_candidates = 200
"
"vnoremap /g y:Unite grep::-iHRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
"
"autocmd FileType unite call s:unite_my_settings()
"function! s:unite_my_settings()
"  nmap <buffer> <C-c> <Plug>(unite_exit)
"endfunction

"" Vinarise
let g:vinarise_enable_auto_detect = 1

"" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

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
  return system("ls $HOME/.vim/bundle/lightline.vim/autoload/lightline/colorscheme/ | perl -pe 's/(.+)\.vim/$1/' ")
endfunction

"" smartword
map w   <Plug>(smartword-w)
map b   <Plug>(smartword-b)
map e   <Plug>(smartword-e)
map ge  <Plug>(smartword-ge)

"" QuickRun
let g:quickrun_config = {
  \ "_" : {
  \   "runner" : "vimproc",
  \   "runner/vimproc/updatetime" : 10,
  \   "outputter/buffer/split" : "botright 5sp",
  \   "outputter/buffer/close_on_empty" : 1
  \   },
  \ }

"" llvm
augroup filetype
  au! BufRead,BufNewFile *.ll set filetype=llvm
augroup END
augroup filetype
  au! BufRead,BufNewFile *.td set filetype=tablegen
augroup END

"" rust
let g:rust_recommended_style = 2

"" go
"let g:neocomplete#sources#omni#input_patterns#go='\h\w\.\w*'

autocmd FileType go :highlight goErr ctermfg=red
autocmd FileType go :match goErr /\<err\>/

