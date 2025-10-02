# Fresh Ubuntu install

This is the set of apps, tools and widgets, that I usually use through all
Ubuntu instances, that I am working on. Some are for desktop only, some for
both desktop and server. This is meant mainly as a reminder of what I need
to install on a fresh system.

## VPN, browser, cloud, terminal emulators

### some basics

```sh
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl bat fzf htop tmux zsh fonts-powerline git python3-pip \
python3-venv npm
sudo ln -s /usr/bin/batcat /usr/local/bin/bat
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
cd $HOME
mkdir -p data/soft
```

>`fonts-powerline` is needed for ohmyzsh themes
>`pyton3-venv` is generally useful, but also required for NeoVim debugging
>`npm` is needed for installing some NeoVim plugins (e.g. Markdown linter)

Install ohmyzsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Clone autosuggestions and syntax highlightning for zsh.

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Fuzzy Finder and NeoVim are better installed in latest version to make use
of new functions.

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

Update node.js for Copilot to work in NeoVim

```sh
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs
```

To display proper fonts/icons in NeoVim, install Nerd Fonts
(I use NeoVim in kitty terminal, which has them set up.)

```sh
cd $(mktemp -d)
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
# install the fonts system-wide, or in ~/.local/share/fonts just for user
sudo unzip JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMonoNF
fc-cache -fv
# optional: verify installation
fc-list | grep "JetBrains"
```

>**Run NeoVim only after cloning dotfiles repo to prevent unnecessary configs.**

Some desktop only tools

```sh
sudo apt install -y kitty terminator gnome-tweaks alacarte btop cargo \
gdebi libreoffice-writer libreoffice-calc

```

Don't mind about the looks of kitty or zsh right now, it will be sorted out
after cloning .dotfiles

Install Gnome Shell extensions

```sh
sudo apt install -y gnome-shell-extensions gnome-shell-extension-manager
```

List of used extensions:

```sh
quick-settings-audio-panel@rayzeq.github.io
mprisLabel@moon-0xff.github.com
logomenu@aryan_k
clipboard-indicator@tudmotu.com
panel-workspace-scroll@polymeilex.github.io
just-perfection-desktop@just-perfection
lockkeys@vaina.lt
tilingshell@ferrarodomenico.com
# install on T470s (dual battery)
dualbattery@gnome
battery-time@eetumos.github.com
# installed by system
ubuntu-appindicators@ubuntu.com
ubuntu-dock@ubuntu.com # might as well disable it
drive-menu@gnome-shell-extensions.gcampax.github.com
launch-new-instance@gnome-shell-extensions.gcampax.github.com
places-menu@gnome-shell-extensions.gcampax.github.com
system-monitor@gnome-shell-extensions.gcampax.github.com
```

### Brave

```sh
curl -fsS https://dl.brave.com/install.sh | sh
```

Or install snap from App Store.

### ZeroTier

```sh
curl -s https://install.zerotier.com | sudo bash
```

Install Nextcloud and setup sync.

### nchat & ncspot

I've encountered severe freezes when running Whatsap app, Spotify app
and PyCharm (love it, but is resource hungry AF) on X1 Carbon gen 9 with
16 GB RAM to the extent, taht only remedy was hard reset.
So I decided to switch to CLI tools. Hence the use of `nchat`,
`ncspot` and `nvim`...

For installing `nchat` follow its [README.md](https://github.com/d99kris/nchat)

For installing `ncspot` you need cargo (already installed above) and working
Rust installation

```sh
# on Ubuntu 25.04+ might already have rust installed, 
# but you need 1.85+
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# exit the terminal, fire it up again and update rust to nightly version
rustup install nightly
# https://github.com/hrkfdn/ncspot/blob/main/doc/developers.md
sudo apt install -y libdbus-1-dev libncursesw5-dev libpulse-dev libssl-dev \
libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev
cargo install ncspot
# if it fails clone repo to $HOME/data/soft/ncspot and build it
git clone https://github.com/hrkfdn/ncspot
cargoo build --release
# make alias, link or add to $PATH
```
