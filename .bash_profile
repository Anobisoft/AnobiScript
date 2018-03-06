
export PATH=/usr/local/opt/coreutils/libexec/gnubin:~/Anobisoft/AnobiScript:$PATH

source .prompt
source .functions
source .aliases

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
