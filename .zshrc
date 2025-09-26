export ZSH="$HOME/.oh-my-zsh"
export ALIASES="$HOME/.config/aliases"
export CT_DIR="$HOME/.config/custom_tools/"
export LCT_DIR="$HOME/.config/local_custom_tools"
export EDITOR='/home/marpauli/data/soft/nvim-linux-x86_64/bin/nvim'
ZSH_THEME="zhann"
DISABLE_AUTO_TITLE="true"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
)
source $ZSH/oh-my-zsh.sh
source $ALIASES/.aliases
autoload -Uz zcalc
source <(fzf --zsh)
