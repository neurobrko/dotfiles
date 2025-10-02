# Custom Tools

## backup_dotfiles.sh

Script used for backing up conflicting dot files, when checking out dotfiles
repo. It is possible to use `--dry-run` flag to check, which files would
be backed up.

## get_ip.sh

Display and copy to clipboard the IP of a set interface.

## strip_file.sh

Script to strip files of empty lines and comments, while backing up original
file to the same location wither with `.bak` extension, or custom extension
using `-e` flag.

Stripping comments and blank lines usually doesn't bring any real benefit,
it can even make things worse by loss of documentation or harder readability
(hence the backup functionality). So this script is more of an exercise
and proof of concept, rather than something really useful.
