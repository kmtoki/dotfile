### init zsh

## Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


## Paths
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin

export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:/Applications/MacVim.app/Contents/MacOS
export PATH=$PATH:/usr/local/opt/llvm/bin

export GOPATH=$HOME/.go
export PATH=$PATH:/$HOME/.go/bin

export C_INCLUDE_PATH=/usr/local/include
export LD_LIBLARY_PATH=/usr/local/lib


## Prompt
#PROMPT="%(?,%F{green},%F{red}) %~ %f
#> "
prompt pure


## Alias
alias g="google"
alias w="wikipedia"
alias ghc="stack ghc"
alias ghci="stack ghci"
alias runghc="stack runghc"
alias ir="ri"

function psp {
  ps -axo "pid %cpu %mem comm" |
  perl -anE '$F[3] =~ s!.+/([^/ ]+)$!$1!; say join "\t",@F[0..3]' |
  sort -n -k 1
}

function ql {
  qlmanage -p $* &> /dev/null
}


## Keymaps
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward


## Options
unsetopt correct_all
