plugins=(git ssh-agent)
eval $(dircolors -b ~/.zsh/dircolors)
ssh-add ~/.ssh/* 2> /dev/null

HISTSIZE=1200
SAVEHIST=2000
HISTFILE=~/.zsh_history

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt histignoredups

function activate() {
	if (( $# == 0 )); then
		echo must provide virtualenv name argument
		return
	fi

	DIR=./$1/bin/activate
	if [ -f $DIR ]; then
		export VIRTUAL_ENV_DISABLE_PROMPT='1'
		source $DIR
	else
		echo Cant activate [$1] in $DIR
	fi
}
