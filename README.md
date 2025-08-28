# .dotfiles setup

>This dotfiles setup is heavily inspired by [this article](https://www.atlassian.com/git/tutorials/dotfiles),
that was inspired by setup of[Sneaky Cobra](https://news.ycombinator.com/item?id=11071754).

## Initial Setup

Add alias to your alias file:

```
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

And don't forget to source it!

```
git init --bare $HOME/.dotfiles
dot config --local status.showUntrackedFiles no
```

Adding config files from your `$HOME` is a breeze:

```
dot add .this_dotfile
dot commit -m "Some commit message"
dot push
```

All common git commands will work as expected.

```
dot diff
dot status
...
```

## Setup on a new instance

```
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo .dotfiles >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles
dot checkout
dot config --local status.showUntrackedFiles no
```

Checkout might lead to error indicating which files should be backed up or
removed before proceeding.

## Dependencies

Few packages needs to be installed to make everything work:

```
sudo apt update && sudo apt upgrade
sudo apt install -y fzf bat
sudo ln -s /usr/bin/batcat /usr/local/bin/bat
```
