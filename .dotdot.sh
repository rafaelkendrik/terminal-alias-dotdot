#!/usr/bin/env sh

_dotdot() {
  local path=$1; shift

  [[ -z $path ]] && {
    cd ../
    return 1
  }

  [[ $path = $HOME || $path = '~' ]] && {
    cd $HOME
    return 1
  }

  [ $path = '-' ] && {
    cd -
    return 1
  }

  local dotdot_alias
  local dotdot_alias_index

  for dotdot_alias_index in ${!DOTDOT_ALIASES[@]}; do
    dotdot_alias=${DOTDOT_ALIASES[$dotdot_alias_index]}

    [ $dotdot_alias_index = $path ] && {
      cd $dotdot_alias
      return 1
    }
  done  

  local i

  for i in $(seq 1 $path)
    do cd ../
  done
}

alias ..="_dotdot"
