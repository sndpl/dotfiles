# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
      . ~/.bashrc
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/local/zend/bin:/usr/local/zend-control:"${PATH}"

export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview/command:$PATH

export PATH=/Applications/SenchaSDKTools-2.0.0-Developer-Preview/jsbuilder:$PATH

##
# Your previous /Users/sandy/.profile file was backed up as /Users/sandy/.profile.macports-saved_2011-11-28_at_16:12:41
##

# MacPorts Installer addition on 2011-11-28_at_16:12:41: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH=/Applications/SenchaSDKTools-1.2.3:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/command:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/jsbuilder:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/appbuilder:$PATH
