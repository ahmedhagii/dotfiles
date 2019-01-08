# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
source ~/.aliases

if [ -f /usr/share/scm/scm-prompt.sh ]; then
  source /usr/share/scm/scm-prompt.sh
fi

# =============
#    HISTORY
# =============

## Command history configuration
HISTSIZE=1000000
SAVEHIST=1000000
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi
setopt append_history
setopt extended_history
setopt hist_expire_dups_first
# ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
# share command history data
setopt share_history


# ===================
#    AUTOCOMPLETION
# ===================

# enable completion
autoload -Uz compinit
compinit
autoload bashcompinit
bashcompinit
zmodload -i zsh/complist
WORDCHARS=''
# do not autoselect the first completion entry
unsetopt menu_complete
unsetopt flowcontrol
# show completion menu on successive tab press
setopt auto_menu
setopt complete_in_word
setopt always_to_end
# Automatically update PATH entries
zstyle ':completion:*' rehash true
# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true


# =============
#    EXPORT
# =============
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export PATH="/usr/local/go/bin:$GOBIN:$HOME/.cargo/bin:$PATH"
export PATH=~/anaconda2/bin:$PATH
# export PATH=$PATH:/Applications/MacVim.app/Contents/bin
# export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx

export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export CLICOLOR=1

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# =============
#    Kubectl Autocomplete
# =============
#

# Customize to your needs...
# source <(kubectl completion zsh)
# source <(kops completion zsh)


## =============
#    Plugins
# =============
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz promptinit
promptinit
prompt damoekri
prompt_dir() {
      prompt_segment blue $PRIMARY_FG " `basename ${PWD/#$HOME/'~'}` "
}

## =============
#    Musc
# =============
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  ~/.cargo/bin
  ~/go/bin
  /usr/local/bin/node
  $path
)

#
# Temporary Files
#
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

