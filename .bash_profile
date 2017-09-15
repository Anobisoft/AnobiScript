PS1="\[\033[1;32m\]\t \[\033[1;33m\]\u@\h \[\033[0;36m\]\W \[\033[0;31m\]# \[\033[0m\]"

export PATH=/usr/local/opt/coreutils/libexec/gnubin:~/Anobisoft/AnobiScript:~/AMScript:$PATH

.load_functions
.load_aliases



# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
