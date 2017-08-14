
PS1="\[\033[1;32m\]\t \[\033[1;33m\]\u@\h \[\033[1;34m\]\w \[\033[0;31m\]# \[\033[0m\]"

export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH:~/AnobiScript:~/scripts

alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*