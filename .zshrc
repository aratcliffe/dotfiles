if [ -f /etc/zshrc ]; then
  . /etc/zshrc
fi

# Aliases
alias ll='ls -l'
alias less='less -i'
alias treeclean='tree -I "node_modules|dist|build|out|temp|.cache|coverage|.vscode|.idea|.DS_Store|Thumbs.db|*.log|bin|obj"'

# Editor preference
export EDITOR=emacs

# Node
export N_PREFIX=~/.n
export PATH=$N_PREFIX/bin:$PATH

# Optional: Keep if using Homebrew-installed Python packages (replace version as needed)
# export PATH=~/Library/Python/3.9/bin:$PATH

# Powerlevel10k
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

DISABLE_AUTO_TITLE="true"

# Dynamic tab title for iTerm2
iterm_tab_title() {
  echo -ne "\e]0;${PWD##*/}\a"
}
add-zsh-hook precmd iterm_tab_title