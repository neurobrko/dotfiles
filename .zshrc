export ZSH="$HOME/.oh-my-zsh"
export ALIASES="$HOME/.config/aliases"
export CT_DIR="$HOME/.config/custom_tools/"
export LCT_DIR="$HOME/.config/local_custom_tools"
export EDITOR="$HOME/data/soft/nvim-linux-x86_64/bin/nvim"
ZSH_THEME=""
DISABLE_AUTO_TITLE="true"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  z
)
source $ZSH/oh-my-zsh.sh
source $HOME/.config/zsh/zhann-elvis.zsh-theme
source $ALIASES/.aliases
autoload -Uz zcalc
source <(fzf --zsh)
