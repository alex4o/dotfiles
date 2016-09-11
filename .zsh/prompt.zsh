#PS1="%B%F{red}%n%b@%m %~ %(#.#.$) %F{white}"
#PS2='\`%_> '
#PS3='?# '
#PS4='+%N:%i:%_> '

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}

function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function git_branch {
 ref=$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)
 echo $ref
}

PROMPT='%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg[white]%}%m%{$reset_color%} $(virtualenv_info)$(prompt_char) %(#.#.$) '

RPROMPT='$(git_branch) %{$fg_bold[green]%}$(collapse_pwd)%{$reset_color%}'

LANG=en_US.UTF-8
LANGUAGE=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=en_US.UTF-8
