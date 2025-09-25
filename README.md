# on a fresh install
This the set of apps, tools and widgets, that I usually use through all Ubuntu instances, that I am working on. Some are for desktop only, some for both desktop and server.
This part is ment mainly as a reminder of what I need to install on a fresh system.

## VPN, browser, cloud, terminal emulators

### some basics
```sh
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl bat fzf
sudo ln -s /usr/bin/batcat /usr/local/bin/bat
# desktop only (btop is not very useful on server)
sudo apt install -y kitty terminator gnome-tweaks alacarte btop
```

Fuzzy Finder and NeoVim are better installed in latest version to make use of new functions.
```sh
# NeoVim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
# https://github.com/neovim/neovim/blob/master/INSTALL.md
#
# Fuzzy Finder - update default Ubuntu package
# https://github.com/junegunn/fzf/releases
```


### Brave

```sh
curl -fsS https://dl.brave.com/install.sh | sh
```

### ZeroTier

```sh
curl -s https://install.zerotier.com | sudo bash
```

# .dotfiles setup

>This dotfiles setup is heavily inspired by [this article](https://www.atlassian.com/git/tutorials/dotfiles),
that was inspired by setup of [Sneaky Cobra](https://news.ycombinator.com/item?id=11071754).

## Initial Setup

Add alias to your alias file:

```sh
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
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

Clone repo and create alias:

```sh
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo .dotfiles >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles
dot checkout
dot config --local status.showUntrackedFiles no
```

Checkout might lead to error indicating which files should be backed up or
removed before proceeding.
Also don't forget to adjust some variables in `.zshrc`, e.g. `$EDITOR`.

## What's inside?

For details of functions and aliases refer to README.md file in
`.config/aliases` and to respective files in this directory. Most of the
functionality is self-explanatory or supplemented with comments.
