#!/usr/bin/env bash
# ~/.bashrc: executed by bash(1) for non-login shells.
#---the original defaul .bashrc config is living in /etc/skel/.bashrc
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Copyright (C) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (C) 2016-present Sven Greb <development@svengreb.de>

# Project:    igloo
# Repository: https://github.com/arcticicestudio/igloo
# License:    MIT
# References:
#   http://stackoverflow.com/questions/19092488/custom-bash-prompt-is-overwriting-itself/19501525#19501528
#   http://mywiki.wooledge.org/BashFAQ/053

# +-----------------+
# + Git Integration +
# +-----------------+
# +--- Dirty State ---+
# Show unstaged (*) and staged (+) changes.
# Also configurable per repository via "bash.showDirtyState".
GIT_PS1_SHOWDIRTYSTATE=true

# +--- Stash State ---+
# Show currently stashed ($) changes.
GIT_PS1_SHOWSTASHSTATE=false

# +--- Untracked Files ---+
# Show untracked (%) changes.
# Also configurable per repository via "bash.showUntrackedFiles".
GIT_PS1_SHOWUNTRACKEDFILES=true

# +--- Upstream Difference ---+
# Show indicator for difference between HEAD and its upstream.
#
# <  Behind upstream
# >  Ahead upstream
# <> Diverged upstream
# =  Equal upstream
#
# Control behaviour by setting to a space-separated list of values:
#   auto     Automatically show indicators
#   verbose  Show number of commits ahead/behind (+/-) upstream
#   name     If verbose, then also show the upstream abbrev name
#   legacy   Do not use the '--count' option available in recent versions of git-rev-list
#   git      Always compare HEAD to @{upstream}
#   svn      Always compare HEAD to your SVN upstream
#
# By default, __git_ps1 will compare HEAD to SVN upstream ('@{upstream}' if not available).
# Also configurable per repository via "bash.showUpstream".
GIT_PS1_SHOWUPSTREAM="auto verbose name"

# +--- Describe Style ---+
# Show more information about the identity of commits checked out as a detached HEAD.
#
# Control behaviour by setting to one of these values:
#   contains  Relative to newer annotated tag (v1.6.3.2~35)
#   branch    Relative to newer tag or branch (master~4)
#   describe  Relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
#   default   Exactly matching tag
GIT_PS1_DESCRIBE_STYLE="contains"

# +--- Colored Hints ---+
# Show colored hints about the current dirty state. The colors are based on the colored output of "git status -sb".
# NOTE: Only available when using __git_ps1 for PROMPT_COMMAND!
GIT_PS1_SHOWCOLORHINTS=true

# +--- pwd Ignore ---+
# Disable __git_ps1 output when the current directory is set up to be ignored by git.
# Also configurable per repository via "bash.hideIfPwdIgnored".
GIT_PS1_HIDE_IF_PWD_IGNORED=false

compile_prompt () {
  local EXIT=$?
  local CONNECTBAR_DOWN=$'\u250C\u2500\u257C'
  local CONNECTBAR_UP=$'\u2514\u2500\u257C'
  local GITSPLITBAR=$'\u2570\u257C'
  local SPLITBAR=$'\u257E\u2500\u257C'
  local ARROW=$'\u25B6'
  local c_gray='\e[01;30m'
  local c_blue='\e[0;34m'
  local c_cyan='\e[0;36m'
  local c_reset='\e[0m'
  local c_red='\e[0;31m'  # Nuevo color rojo para errores

   # Cambio de color solo si el código de salida está entre 127 y 255
  if (( EXIT >= 127 && EXIT <= 255 )); then
    EXIT="${c_red}${EXIT}${c_gray}"  # Aplicar color rojo
  else
    EXIT="${c_blue}${EXIT}${c_gray}"  # Mantener color azul para otros números
  fi

  # > Connectbar Down
  # Format:
  #   (newline)(bright colors)(connectbar down)
  PS1="\n${c_gray}"
  PS1+="$CONNECTBAR_DOWN"

  # > Username
  # Format:
  #   (bracket open)(username)(bracket close)(splitbar)
  PS1+="[${c_blue}\u${c_gray}]"
  PS1+="$SPLITBAR"

  # > Jobs
  # Format:
  #   (bracket open)(jobs)(bracket close)(splitbar)
  PS1+="[${c_blue}\j${c_gray}]"

  # > Exit Status
  # Format:
  #   (bracket open)(last exit status)(bracket close)(splitbar)
  PS1+="[${c_blue}${EXIT}${c_gray}]"
  PS1+="$SPLITBAR"

  # > Time
  # Format:
  #   (bracket open)(time)(bracket close)(newline)(connectbar up)
  PS1+="[${c_blue}\D{%H:%M:%S}${c_gray}]\n"
  PS1+="$CONNECTBAR_UP"

  # > Working Directory
  # Format:
  #   (bracket open)(working directory)(bracket close)(newline)
  PS1+="[${c_blue}\w${c_gray}]\n"

  # > Git
  # Format:
  #   (gitsplitbar)(bracket open)(git branch)(bracket close)(splitbar)
  #   (bracket open)(HEAD-SHA)(bracket close)
  PS1+="$(__git_ps1 " \\u2570\\u257C[${c_cyan}%s${c_gray}]\\u257E\\u2500\\u257C[${c_cyan}$(git rev-parse --short HEAD 2> /dev/null)${c_gray}]")"
  # Append additional newline if in git repository
  if [[ ! -z $(__git_ps1) ]]; then
    PS1+='\n'
  fi

  # > Arrow
  # NOTE: Color must be escaped with '\[\]' to fix the text overflow bug!
  # Format:
  #   (arrow)(color reset)
  PS1+="$ARROW \[\e[0m\]"
}




#=========Aliases=========
alias ct='clear'
alias jc11='source jc 11'
alias jc8='source jc 8'
alias jc17='source jc 17'
alias x='exit'

alias ss='screenshot select'
alias sw='screenshot window'
alias mntsda='sudo mount -o ntfs /dev/sda3 /mnt/sda'
alias ls='ls -hN --color=auto --group-directories-first'

alias start-apache2='sudo systemctl start apache2'
alias stop-apache2='sudo systemctl stop apache2'
alias restart-apache2='sudo systemctl restart apache2'

#-------------------------
set -o vi

#-------Environment Var---------------
export PATH="$HOME/.local/bin:$PATH"
export THEME_MODE=$(cat ~/.config/theme_mode)





#-------------------------------------
source /usr/share/bash-completion/bash_completion
PROMPT_COMMAND='compile_prompt'
