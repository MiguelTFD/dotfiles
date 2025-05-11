# Base PATH
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ]        && PATH="$HOME/bin:$PATH"
export PATH

# Global Variables
export EDITOR=vim
export THEME_MODE=$(cat ~/.config/theme_mode)

# Load .bashrc
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
