#! /bin/bash
#
# custom.google.bash
# Copyright (C) 2019 xyharry <xyharry@malygos.mtv.corp.google.com>
#
# Distributed under terms of the MIT license.
#

LDAP=xyharry
GOOGLE_BASE_DIR=/google/src/cloud/${LDAP}/


print_client_path() {
  path=`g4 g4d`
  if [ -z $path ]; then
    echo ~
  else 
    echo $path
  fi
}
alias ~~=print_client_path

function _google_choose_client_name_auto_complete()
{
  local HOST cur 
  _get_comp_words_by_ref cur
  file_list=(${GOOGLE_BASE_DIR}*)
  HOST=""
  for item in ${file_list[@]}; do
    HOST="${HOST} $(basename ${item})"
  done
  COMPREPLY=( $( compgen -W "${HOST}" -- "${cur}" ) )
}

# Fig is awesome. Let's use it.
# Take one argument as the client name.
function hgd {
  if [ -z $1 ]; then
    echo "[hg] please provide a client name"
  else 
    g4d $1 2> /dev/null || hg citc $1 && g4d $1 
  fi
}

complete -F _google_choose_client_name_auto_complete hgd

function hgsync {
  hg sync
  local status=$?
  if [[ $stauts -eq 0 ]]; then
    hg amend
    hg uc
  fi
}


