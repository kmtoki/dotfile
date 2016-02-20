#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin

export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:/Applications/MacVim.app/Contents/MacOS
export PATH=$PATH:/usr/local/opt/llvm/bin

export GOPATH=$HOME/.go
export PATH=$PATH:/$HOME/.go/bin

export C_INCLUDE_PATH=/usr/local/include
export LD_LIBLARY_PATH=/usr/local/lib

unsetopt correct_all

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

alias ll='ls -al'
alias t='tree'
alias v='nvim'

alias alc='eijiro'

alias psp='ps -o pid,%cpu,%mem,comm | perl -ne"print if $. > 1" | sort -k 3'
alias psps='ps -Ao pid,%cpu,%mem,comm | perl -ne"print if $. > 1" | sort -k 3'

alias free='du -sx / &> /dev/null & sleep 25 && kill $!'

#PROMPT="%(?,%F{green},%F{red}) %~ %f
#> "
