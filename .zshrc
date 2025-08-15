export ZSH="$HOME/.oh-my-zsh"
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# set zsh theme to empty to support Pure prompt
ZSH_THEME=""

# key bindings
bindkey '^H' backward-kill-word

#  plugins
plugins=(git web-search fzf zsh-nvm)
source $ZSH/oh-my-zsh.sh

# init zoxide
eval "$(zoxide init zsh)"

# init pure prompt after oh-my-zsh
autoload -U promptinit; promptinit
prompt pure

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
