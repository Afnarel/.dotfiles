# Check for an interactive session:
# http://www.gnu.org/software/bash/manual/bashref.html#Is-this-Shell-Interactive_003f
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#[[ $- != *i* ]] && return

# create an archive from a directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

# ex - extract an archive
# usage: ex <file>
ex()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjvf $1 ;;
            *.tar.gz)    tar xzvf $1 ;;
            *.tar.xz)    tar Jxvf $1 ;;
            *.bz2)       bunzip2 $1 ;;
            *.rar)       unrar x $1 ;;
            *.gz)        gunzip $1 ;;
            *.tar)       tar xvf $1 ;;
            *.tbz2)      tar xjvf $1 ;;
            *.tgz)       tar xzvf $1 ;;
            *.zip)       unzip $1 ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1 ;;
            *)           echo -e "'$1' can't be uncompressed with ex()" ;;
        esac
    else
        echo -e "\n'$1' is an invalid file"
    fi
}

alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias .='PS1= builtin .'
alias py=python
alias py2=python2
alias py3=python3
alias ?=pydoc
alias ??=pydoc2
alias vi=vim
alias venv=mkvirtualenv
alias ls='ls --color=auto'
alias mv='mv -i'
alias gcc-strict='gcc -std=c99 -pedantic -Wall'
alias grep='grep --color=auto -n'
alias killbg='kill %{1..1000} 2>/dev/null'
alias doc='cd ~/Documents'
alias down='cd ~/Downloads'
alias jj='. jjbin'
alias mm='. mmbin'
# wr is in my scripts directory
alias fren='wr fren' # Search WordReference (fr/en)
alias enfr='wr enfr' # Search WordReference (en/fr)

shopt -s dirspell
shopt -s checkwinsize

export EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000
export PATH=".:/usr/local/bin:~/bin:~/Documents/scripts:$PATH"
export PYTHONSTARTUP=~/.pythonrc.py
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_HOOK_DIR=~/.virtualenvs_hooks

# bash-completion
# Already sourced in /etc/bash.bashrc
if [ -r /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
else
    echo "Warning: bash_completion file not found or not readable"
fi

# virtualenvwrapper
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    . /usr/bin/virtualenvwrapper.sh
else
    echo "Warning: virtualenvwrapper.sh file not found"
fi

# for __git_ps1
if [ -f /usr/share/git/git-prompt.sh ]; then
    . /usr/share/git/git-prompt.sh
else
    echo "Warning: git-prompt.sh file not found"
fi

git-branch() {
    __git_ps1 2>/dev/null
}

# Show the list of autocompletion options after the first tab
bind 'set show-all-if-ambiguous on'
# Do now show hidden files during tab completion
bind 'set match-hidden-files off'
# Ask if I want to display all the possibilities when there are
# more than 50 autocompletion options
bind 'set completion-query-items 50'
# bind \C-w:backward-kill-word # works natively

stty stop '' # disable ^S


#######
# PS1 #
#######

too-long()
{
    pfad=${PWD/#$HOME/\~}
    if [[ ${#pfad} -lt 30 ]]; then
        echo -n "${pfad}"
    else
        echo -n ".../`basename "$pfad"`"
    fi
}

check="\[\033[01;37m\]\$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\[\234\223\]\"; else echo \"\[\033[01;31m\]\342\[\234\227\]\"; fi)\[\e[0m\]"
time="\A"
user="\[\e[1;37m\]\u\[\e[0m\]"
host="\[\e[1;34m\]\h\[\e[0m\]"
dir="\[\e[1;32m\]\$(too-long)\[\e[0m\]"
branch="\[\e[1;36m\]\$(git-branch)\[\e[0m\]"
root="\\$"
PS1=" $check $time $user @ $host in $dir$branch $root "

#############
# SSH agent #
#############

eval `ssh-agent -s` > /dev/null 2>&1
ssh-add ~/.ssh/aether33 > /dev/null 2>&1
ssh-add ~/.ssh/afnarel > /dev/null 2>&1

################
# Mac specific #
################

# use gnu coreutils on Mac (and use the right man pages)
#export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
