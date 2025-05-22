# ~/.bashrc: executed by bash(1) for non-login shells.

# ── exit on non-interactively session ───────────────────────────────────────── 
case $- in
    *i*) ;;
      *) return;;
esac


# ── history settings ──────────────────────────────────────────────────────────
HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize


# ── general settings ──────────────────────────────────────────────────────────
set -o vi


# ── environment ───────────────────────────────────────────────────────────────
if [ -f ~/.openv ]; then
    . ~/.openv
fi

if [ -f ~/.hiddenv ]; then
    . ~/.hiddenv
fi


# ── tool settings ─────────────────────────────────────────────────────────────
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"


# ── path settings  ────────────────────────────────────────────────────────────
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# ── alias definitions ─────────────────────────────────────────────────────────
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# ── bash completion ───────────────────────────────────────────────────────────
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# ── starship init ─────────────────────────────────────────────────────────────
eval "$(starship init bash)"
