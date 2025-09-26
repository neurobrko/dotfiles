#!/bin/bash

# Script to strip file of empty lines and comments.
# If frist line is shebang, it is kept.
# Original file is copied to original.bkp_ext in th same dir.
#
# TODO:
# - add verbosity and some color
# - strip bkp_ext of leading . if present
# - create -r option to revert comments and spaces and remove bkp file with
#   lookup for bkp file, when bkp_ext is non-default

usage() {
  echo "Usage: $0 [-e] <file>"
  echo "       -e Extension of original file. Default: .bak"
  exit 1
}

e_flag=false

while getopts ":e:" opt; do
  case ${opt} in
  e)
    e_flag=true
    bkp_ext=$OPTARG
    ;;
  \?)
    echo "Invalid option: -$OPTARG" 1>&2
    usage
    ;;
  :)
    echo "Invalid option: -$OPTARG requires an argument" 1>&2
    usage
    ;;
  esac
done

shift $((OPTIND - 1))

if [ $# -lt 1 ]; then
  echo "Error: Missing file argument!"
  usage
fi

filename=$1

if [ $e_flag = false ]; then
  bkp_ext=".bak"
fi

cp "$filename" "$filename.$bkp_ext"

awk 'NR==1 && /^#!/ {print; next} !/^[[:space:]]*($|#)/' "$filename.$bkp_ext" >"$filename"
