alias ..='cd ..'            # Go up one directory
alias ...='cd ../..'        # Go up two directories
alias ....='cd ../../..' 
path=($path /usr/local/bin)

alias ls="ls --group-directories-first --color=auto"
alias ll="ls --group-directories-first -lA --color=auto"
alias la="ls --group-directories-first -a --color=auto"
alias grep="grep --color=auto"
alias cp="cp -v"
alias mv="mv -v"
alias ln="ln -v"
alias pi="pacaur -S"
alias pu="pacaur -Syu"

alias npm-exec='PATH=$(npm bin):$PATH'

alias nethack='telnet nethack.alt.org'

alias aurcheck="cower -u | awk '{printf(\"%s \", \$2)} END {printf(\"\n\")}'"

alias servethis="python3 -m http.server"
alias screanshot="vendace"
alias prscr="vendace"
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
