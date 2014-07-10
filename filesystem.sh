#!/bin/bash
 
# ================================================
# Tar/unTar helpers
# ================================================
alias minitar='tar cvpzf'
alias miniuntar='tar -xvpzf'
 
# Recursively find and remove `.DS_STORE` and `.apdisk` within the current working directory.
function rmds {
  find . -name ".apdisk" -print0 | xargs -0 rm -Rf
  find . -name ".DS_Store" -print0 | xargs -0 rm -Rf
  find . -name "._*" -print0 | xargs -0 rm -Rf
}
 
# ================================================
# Search Methods
# ================================================
function find_in_files {
  clear
 
  if [ $# -ne 1 ]
  then
    echo "      Usage: $0 <string to search for>"
    echo "       ie. $0 password"
    echo
    exit
  fi
 
  echo "Looking for \"$1\" in:" `pwd`
  grep "$1" -rin * | grep -v \.svn | more
}
 
 
##
# fib just means that its "tattling" on you.  Its just how I think I guess :)
##
function fib {
  if [ $# -ne 1 ]
  then
    echo "      Usage: $0 <string to search for>"
    echo "       ie. $0 ssh\n"
    exit
  fi
 
  echo "Looking for \"$1\" in: $HOME..."
  cat $HOME/.bash_history | grep -i "$1"
}