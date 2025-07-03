if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# Alias instructions
alias ll='ls -l'
alias less='less -i'
alias treeclean='tree -I "node_modules|dist|build|out|temp|.cache|coverage|.vscode|.idea|.DS_Store|Thumbs.db|*.log|bin|obj"'

# Exported variables
export EDITOR=emacs
export N_PREFIX=~/.n
export PATH=$N_PREFIX/bin:~/Library/Python/3.9/bin:/opt/homebrew/opt/libpq/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home

# p10k
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

DISABLE_AUTO_TITLE="true"

iterm_tab_title() {
  echo -ne "\e]0;${PWD##*/}\a"
}
add-zsh-hook precmd iterm_tab_title
export PATH="/opt/homebrew/opt/conan@1/bin:$PATH"
