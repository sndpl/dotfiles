# Misc
alias vi='vim'
alias ls='ls -CF'
alias openmsx='/Applications/openMSX.app/Contents/MacOS/openmsx'

# Ack
alias ackp='ack --type=php'
alias acksql='ack --type=sql'

# disk free / usage
alias df='df -h'
alias du='du -hs'

# history
alias h='history'
alias hg='history | grep -i $1 --color=auto'

# processes
alias ps='ps -ef'
alias psg='ps -ef | grep $1 --color=auto'

# file finder
function ff() { find . -type f -iname '*'$*'*' -ls ; }
function sff() { sudo find . -type f -iname '*'$*'*' -ls ; }

# colorful, recursive grep with line numbers and excluding SVN
gr () { grep -risn "$1" . --color=always | grep -v '.svn\|.git\|\~' ; }
grl () { grep -risn "$1" . --color=always | grep -v '.svn\|.git' | less -R ; }

#svn aliases
alias svnup='svn update | ~/bin/highlight red "C .*" green "G .*" blue "A .*" yellow "D .*"'
alias svnst='svn status | ~/bin/highlight red "D .*" green "\? .*" blue "A .*"'
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'

# Delete all .svn directories starting from current directory
svnclean () { find . -name '.svn' -exec rm -rf '{}' \; ; }

alias svn-tunnel='sudo ssh  -L 127.0.0.1:80:svn.ilsemedia.nl:80 sandy@frontdoor.ibuildings.com'
alias relocate='svn switch --relocate http://svn.ibuildings.nl/ibuildings/ https://svn.ibuildings.com/ibuildings/'

function extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
function GET() {
  curl -i -X GET -H "X-Requested-With: XMLHttpRequest" $*
}

function POST() {
  curl -i -X POST -H "X-Requested-With: XMLHttpRequest" $*
  #-d "key=val"
}

function PUT() {
  curl -i -X PUT -H "X-Requested-With: XMLHttpRequest" $*
}

function DELETE() {
  curl -i -X DELETE -H "X-Requested-With: XMLHttpRequest" $*
}

alias o='open .'

# replacement netstat cmd to find ports used by apps on OS X
alias netstat="sudo lsof -i -P"
alias pubkey="cat $HOME/.ssh/*.pub | pbcopy && echo 'Keys copied to clipboard'"

alias hidefile='/usr/bin/SetFile -a "V"'
alias showfile='/usr/bin/SetFile -a "v"'

function manpdf() { man -t $@ | open -f -a Preview; }
function osinfo() { 
   x1="$(/usr/bin/sw_vers -productName)"
   x2="$(/usr/bin/sw_vers -productVersion)"
   x3="$(/usr/bin/sw_vers -buildVersion)"
   x4="$(/usr/bin/arch)"
   echo "${x1} - ${x2} - ${x3} - ${x4}"
}

# SSH
alias front="ssh sandy@frontdoor.ibuildings.com"


