#!/bin/bash

# Collection of useful alias
# start this script at the end of .bashrc

alias up='sudo apt-get update; sudo apt-get dist-upgrade -y; sudo apt-get autoclean -y; sudo apt-get autoremove -y'

diskusage () { du -h $1 | sort -rh; }


# Bintoolbox's script should call through bash
alias h264='bash h264'


# Should be already present in .bashrc
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lah'
alias ls='ls --color=auto'
