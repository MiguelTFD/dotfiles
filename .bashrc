# ~/.bashrc
case $- in
  *i*) ;;
     *) return;;
esac

# Historial y opciones
HISTCONTROL=ignoreboth
shopt -s histappend checkwinsize
HISTSIZE=1000
HISTFILESIZE=2000

# chroot detection
if [ -r /etc/debian_chroot ]; then
  debian_chroot=$(< /etc/debian_chroot)
fi

# Environment
export PATH="$HOME/.local/bin:$PATH"
export THEME_MODE=$(cat ~/.config/theme_mode)

# Starship prompt
eval "$(starship init bash)"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Bash completion
if ! shopt -oq posix; then
  [ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion \
    || [ -f /etc/bash_completion ] && source /etc/bash_completion
fi

# Alias base
alias ct='clear'
alias x='exit'
alias ss='screenshot select'
alias sw='screenshot window'
alias mntsda='sudo mount -o ntfs /dev/sda3 /mnt/sda'
alias mntusb='sudo mount -t vfat /dev/sdb1 /mnt/usb'
alias untargz='tar -xvzf'
alias untarxz='tar -xvJf'
alias start-apache2='sudo systemctl start apache2'
alias stop-apache2='sudo systemctl stop apache2'
alias restart-apache2='sudo systemctl restart apache2'
alias screenfilm='ffmpeg -video_size 1920x1080 -framerate 30 -f x11grab -i :0.0 ~/Videos/screenrecordings/$(date +"%Y-%m-%d_%H-%M-%S").mp4'
alias ls='ls -hN --color=auto --group-directories-first'

# User overrides
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.hiddenv ]        && source ~/.hiddenv

# Vi mode
set -o vi
