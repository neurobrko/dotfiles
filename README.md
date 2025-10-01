# .dotfiles setup

>This dotfiles setup is heavily inspired by [this article](https://www.atlassian.com/git/tutorials/dotfiles),
that was inspired by setup of [Sneaky Cobra](https://news.ycombinator.com/item?id=11071754).

## Initial Setup

Add alias to your alias file:

```sh
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

And don't forget to source it!

```sh
git init --bare $HOME/.dotfiles
dot config --local status.showUntrackedFiles no
```

Adding config files is a breeze:

```sh
dot add .this_dotfile
dot commit -m "Some commit message"
dot push
```

All common git commands will work as expected.

```sh
dot diff
dot status
...
```

## Setup on a new instance

To make everything work, follow [fresh_install.md](https://github.com/neurobrko/dotfiles/blob/main/fresh_install.md)

Clone repo and create alias:

```sh
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
echo .dotfiles >> .gitignore
git clone --bare https://github.com/neurobrko/dotfiles.git $HOME/.dotfiles
dot checkout
dot config --local status.showUntrackedFiles no
```

Checkout might lead to error indicating which files should be backed up or
removed before proceeding. To backup those files, you can use
`backup_dotfiles.sh` from `custom_tools`.
Also don't forget to adjust some variables in `.zshrc` to suite your setup.

## What's inside?

For details of functions and aliases refer to README.md file in
`.config/aliases` and to respective files in this directory. Most of the
functionality is self-explanatory or supplemented with comments.
