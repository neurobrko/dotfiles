#!/bin/bash

# Script to strip file of empty lines and comments.
# If frist line is shebang, it is kept.
# Original file is copied to original.bkp_ext in th same dir.
#
# Stripping comments and blank lines from config files usually does not bring
# any real benefit, and it can even make things worse.
# (loss of documnetation, harder readability,...)
# So this is more of an exercise then a script usable in real life.
#
# TODO:
# - create -r option to revert comments and spaces and remove bkp file with
#   lookup for bkp file, when bkp_ext is non-default

# Display usage
usage() {
  echo "Usage: $0 [-e] <file>"
  echo "       -e Extension of original file. Default: .bak"
  echo "       -h Print usage"
  exit 1
}

# parse arguments
e_flag=false

while getopts ":e:h" opt; do
  case ${opt} in
  h)
    usage
    ;;
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

# chceck if file argument is present
if [ $# -lt 1 ]; then
  echo "Error: Missing file argument!"
  usage
fi

if [ $e_flag = false ]; then
  bkp_ext=".bak"
else
  bkp_ext="${bkp_ext#.}" # remove leading . if present
fi

filename=$1
bkp_filename=${filename}.$bkp_ext

cp "$filename" "$bkp_filename" || {
  echo "Error: Could not create backup file $bkp_filename"
  exit 1
}

awk 'NR==1 && /^#!/ {print; next} !/^[[:space:]]*($|#)/' "$filename.$bkp_ext" >"$filename"

echo "Done!"
echo "Original file backed up as $bkp_filename"
