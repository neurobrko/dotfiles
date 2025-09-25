# Fresh Ubuntu install
This is the set of apps, tools and widgets, that I usually use through all Ubuntu instances, that I am working on. Some are for desktop only, some for both desktop and server.
This part is ment mainly as a reminder of what I need to install on a fresh system.

## VPN, browser, cloud, terminal emulators

### some basics
```sh
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl bat fzf htop tmux zsh zsh-syntax-highlighting zsh-autosuggestions fonts-powerline git python3-pip
sudo ln -s /usr/bin/batcat /usr/local/bin/bat
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
cd $HOME
mkdir -p data/soft
```

Install ohmyzsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Fuzzy Finder and NeoVim are better installed in latest version to make use of new functions.
```sh
# NeoVim
cd "$(mktemp -d)"
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xvf nvim-linux-x86_64.tar.gz -C $HOME/data/soft
#
# Fuzzy Finder - update default Ubuntu package
# https://github.com/junegunn/fzf/releases
wget latest-fzf.tar.gz
sudo tar xvf latest-fzf.tar.gz -C /usr/bin
```

Some desktop only tools
```sh
sudo apt install -y kitty terminator gnome-tweaks alacarte btop cargo
```
Don't mind about the looks of kitty or zsh right now, it will be sorted out after cloning .dotfiles

### Brave

```sh
curl -fsS https://dl.brave.com/install.sh | sh
```

### ZeroTier

```sh
curl -s https://install.zerotier.com | sudo bash
```

### nchat & ncspot
I've encountered severe freezes when running Whatsap app, Spotify app and PyCharm (love it, but is resource hungry AF) on X1 Carbon gen 9 with 16 GB RAM to the extent, taht only remedy was hard reset.
So I decided to switch to CLI tools. Hence the use of `nchat`, `ncspot` and `nvim`...

For installing `nchat` follow its [README.md](https://github.com/d99kris/nchat)

For installing `ncspot` you need cargo (already installed above) and working Rust installation
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# https://github.com/hrkfdn/ncspot/blob/main/doc/developers.md
sudo apt install libdbus-1-dev libncursesw5-dev libpulse-dev libssl-dev libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev
cargo install ncspot
```

TODO:
gnome extensions
