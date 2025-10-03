plugins=(git ssh-agent)
# Initialize LS_COLORS if GNU dircolors is available (gdircolors on macOS via coreutils)
if command -v gdircolors >/dev/null 2>&1; then
  eval "$(gdircolors -b ~/.zsh/dircolors 2>/dev/null || gdircolors -b)"
elif command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b ~/.zsh/dircolors 2>/dev/null || dircolors -b)"
fi

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
