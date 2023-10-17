if [ -f /etc/zshrc ]; then
	. /etc/zshrc
fi

# Alias instructions
alias ll='ls -l'
alias less='less -i'

# Exported variables
export EDITOR=emacs
export N_PREFIX=~/.n
export PATH=$N_PREFIX/bin:~/Library/Python/3.9/bin:/opt/homebrew/opt/libpq/bin:~/Library/Android/sdk/platform-tools:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# p10k
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

DISABLE_AUTO_TITLE="true"

iterm_tab_title() {
  echo -ne "\e]0;${PWD##*/}\a"
}
add-zsh-hook precmd iterm_tab_title
