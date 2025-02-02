# Zsh Settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="headline"
export XDG_CONFIG_HOME="$HOME/.config"
source "$ZSH/oh-my-zsh.sh"

# Aliases
alias vim=nvim
alias kill_port=findandkill

# Functions
findandkill() {
  lsof -ti:3000 | xargs kill
}

KITTY_SCRIPTS="$HOME/.config/kitty"
change_kitty_profile() {
  sh "$KITTY_SCRIPTS/change-profile.sh"
}

toggle_kitty_transparency() {
  sh "$KITTY_SCRIPTS/toggle-transparency.sh"
}

# NVM Initialization
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Keyboard Settings (apply only once)
if [ ! -f ~/.config/.keyboard_configured ]; then
  defaults write NSGlobalDomain KeyRepeat -int 1
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  touch ~/.config/.keyboard_configured
fi

# Terraform Auto-Completion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
