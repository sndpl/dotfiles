# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# Shell behavior variables (see 'man bash' for details)

# correct typing errors
shopt -s cdspell

# allow use of exported variables in cd
shopt -s cdable_vars

# checks that a command found in the hash table exists
# before trying to execute it.  If a hashed command
# no longer exists, a  normal path search is performed
shopt -s checkhash

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# attempts to save all lines of a multiple-line command
# in the same history entry.  This allows easy re-editing
# of multi-line commands
shopt -s cmdhist

# enabled extended pattern matching features
shopt -s extglob

# append to the history file, don't overwrite it
# opportunity to re-edit a failed history substitution
# history substitution not immediately passed to the shell parser
shopt -s histappend histreedit histverify

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# if readline is being used, bash will not attempt to search the PATH
# for possible completions when completion is attempted on an empty line
shopt -s no_empty_cmd_completion

# the source (.) builtin uses the value of PATH to find
# the directory containing the file supplied as an argument
shopt -s sourcepath

# ignore case, long prompt, exit if it fits on one screen, allow colors for ls and grep colors
export LESS="-iMFXR"

# allow ctrl-S (forward search) for history navigation (with ctrl-R)
stty -ixon

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

git_completion='/opt/local/share/doc/git-core/contrib/completion/git-completion.bash'

if [ -f $git_completion ]; then
  source $git_completion
fi
source ~/.git-flow-completion.sh

GIT_PS1_SHOWDIRTYSTATE=true

parse_git_branch () {
    git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git::\1)#'
}
parse_svn_branch() {
    #parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn::"$1")" }'
    parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | egrep -o '(tags|branches)/[^/]+|trunk' | egrep -o '[^/]+$' | awk '{print $1 }'
}
parse_svn_url() {
    svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
    svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}
BLACK="\[\033[0;38m\]"
RED="\[\033[01;32m\]"
RED_BOLD="\[\033[01;31m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\033[0;32m\]"

if [ "$color_prompt" = yes ]; then
    #PS1="\[\e[2;37m\][\A] $BLACK[$RED\u@\h $BLUE\w$RED_BOLD\$(parse_git_branch)\$(parse_svn_branch)$BLACK ]$ "
    source ./.bash_prompt
else
    PS1='\h:\W \u\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'    
    ;;
*)
    ;;
esac

# Default editor
export EDITOR=vim
export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad
# Solarized
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export LC_ALL=C
export LESSCHARSET='latin1'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    #eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Colored man pages
export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

export PATH=/Users/sandy/pear/bin:$PATH
export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview/command:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview/jsbuilder:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/command:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/jsbuilder:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/appbuilder:$PATH
