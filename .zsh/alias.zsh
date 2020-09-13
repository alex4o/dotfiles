alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..' 

alias ls="ls --group-directories-first --color=auto"
alias ll="ls --group-directories-first -lA --color=auto"
alias la="ls --group-directories-first -a --color=auto"
alias grep="grep --color=auto"
alias cp="cp -v"
alias mv="mv -v"
alias ln="ln -v"
alias diff="diff --color"

alias open="xdg-open"

alias npm-exec='PATH=$(npm bin):$PATH'

alias nethack='telnet nethack.alt.org'


alias servethis="python3 -m http.server"

alias prom="sudo ip link set wlan0 promisc on"
alias promoff="sudo ip link set wlan0 promisc off"

function print_address() {
	if (( $1 == 8080 )); then
		printf "%s\n" "https://tunnel.bonin.tech"
	else
		printf "%s\n" "tunnel.bonin.tech:$1"
	fi
}

function tunnel() {
	if (( $# == 0 ));
	then 
		echo "usage: tunnel [local-port] [remote-port]"
		echo "use remote port 8080 to use the webserver forwarding"
	fi
	
	printf "%s" "Tuneling port: localhost:$1 to "
	
	if (( $# == 1 ));
	then 
		if (( $1 == 80 )); then
			remote_port=8080
		else
			remote_port=$1
		fi
	elif (( $# == 2 ));
	then
		if (( $2 == 80 )); then
			remote_port=8080
		else
			remote_port=$2
		fi
	fi
	print_address $remote_port
	ssh -N -R $remote_port\:localhost\:$1 tunnel@tunnel.bonin.tech
}

