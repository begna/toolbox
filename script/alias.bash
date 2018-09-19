#!/bin/bash

# Collection of useful alias
# start this script at the end of .bashrc

alias up='sudo apt update; sudo apt dist-upgrade -y; sudo apt autoclean -y; sudo apt autoremove -y; apt moo'

diskusage () { du -h $1 | sort -rh; }
diskusageM () { du -h $1 | sort -rh | grep -v '[0-9]K'; }


# Bintoolbox's script should call through bash
alias h264='bash h264'


# Should be already present in .bashrc
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lah'
alias ls='ls --color=auto'
