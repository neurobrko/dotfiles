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
python3-venv npm git-delta eza
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
# List and preview of available Nerd Fonts:
# https://www.nerdfonts.com/font-downloads
sudo mkdir /usr/share/fonts/NerdFont
cd $(mktemp -d)
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/0xProto.zip
# install the fonts system-wide, or in ~/.local/share/fonts just for user
sudo unzip 0xProto.zip -d /usr/share/fonts/NerdFont/0xProtoNerdFont
fc-cache -fv
# optional: verify installation
fc-list | grep "0xProto"
```

>**Run NeoVim only after cloning dotfiles repo to prevent unnecessary configs.**

Some desktop only tools

```sh
sudo apt install -y kitty terminator gnome-tweaks alacarte btop cargo \
gdebi libreoffice-writer libreoffice-calc localsend meld
```

>**BEWARE:** Check if localsend is available in your distribution's repo.
>I found it in Ubuntu 24.04, but not in 25.04.

Don't mind about the looks of kitty or zsh right now, it will be sorted out
after cloning .dotfiles

To setup git-delta and meld, insert these lines to your `~/.gitconfig`

```sh
[core]
  pager = delta
[interactive]
  diffFilter = delta --color-only
[delta]
  side-by-side = true
  navigate = true  # use n and N to move between diff sections
  dark = true      # or light = true, or omit for auto-detection
[merge]
  conflictStyle = zdiff3
 tool = meld
[mergetool]
 prompt = false
```

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

### yazi file manager

Install yazi file manager and simple neovim yazi plugin.

```sh
# https://yazi-rs.github.io/docs/installation/
# prerequisites
apt install ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
# yazi installation
cargo install yazi-fm yazi-cli
```

### Installed tools summary

Here is the list of some tools installed above, with brief description and
links to their repositories or websites.

- **alacarte** - menu editor for GNOME
- **bat** - cat clone with syntax highlighting [github](https://github.com/sharkdp/bat)
- **btop** - resource monitor (htop alternative) [github](https://github.com/aristocratos/btop)
- **eza** - ls clone with more features [github](https://github.com/eza-community/eza)
- **fzf** - command-line fuzzy finder [github](https://github.com/junegunn/fzf)
- **gdebi** - simple tool to install deb packages
- **git-delta** - git diff viewer with syntax highlighting [github](https://github.com/dandavison/delta)
- **kitty** - GPU based terminal emulator [website](https://sw.kovidgoyal.net/kitty/)
- **localsend** - easy and private file sharing over LAN [website](https://localsend.org/)
- **meld** - visual diff and merge tool [website](https://meldmerge.org/)
- **nchat** - terminal based chat client for WhatsApp [github](https://github.com/d99kris/nchat)
- **ncspot** - terminal based Spotify client [github](https://github.com/hrkfdn/ncspot)
- **nerd fonts** - patched fonts with icons [website](https://www.nerdfonts.com) | [download](https://www.nerdfonts.com/font-downloads)
- **terminator** - terminal emulator with tiling support [website](https://gnome-terminator.org/) | [docs](https://gnome-terminator.readthedocs.io/en/latest)
- **tmux** - terminal multiplexer [github wiki](https://github.com/tmux/tmux/wiki)
- **yazi** - terminal based file manager [website](https://yazi-rs.github.io/) | [github](https://github.com/sxyazi/yazi)
