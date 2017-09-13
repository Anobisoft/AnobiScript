PS1="\[\033[1;32m\]\t \[\033[1;33m\]\u@\h \[\033[0;36m\]\W \[\033[0;31m\]# \[\033[0m\]"

export PATH=/usr/local/opt/coreutils/libexec/gnubin:~/Anobisoft/AnobiScript:~/AMScript:$PATH

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias podexupd='pod update --no-repo-update --project-directory=Example'
alias openws='find -name ${PWD##*/}.xcworkspace -exec open {} \;'
alias clearmobileprovision='find ~/Library/MobileDevice/Provisioning\ Profiles/ -name '*.mobileprovision' -delete'
alias repod='pod update --no-repo-update'

function rgb2hex() {
	while read r g b
	do
		echo "obase=16; (($r * 256 + $g) * 256) + $b" | bc 
	done
}

function hex2rgb {
	for hex in $@
	do 	
		b=$(echo "ibase=16; $hex - $hex / 100 * 100" | bc)
		g=$(echo "ibase=16; ($hex - $hex / 10000 * 10000) / 100" | bc)
		r=$(echo "ibase=16; $hex / 10000" | bc)
		echo "$r $g $b"
	done
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
