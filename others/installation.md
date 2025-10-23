# Void installation on ZFS root

> This steps are for ZFS root, if you want to install on ext4, xfs or btrfs, use the [live installer](https://voidlinux.org/download/) then continue to [[installation#Post installation]];

Follow the guide from [ZFSbootMenu](https://docs.zfsbootmenu.org/en/latest/guides/void-linux/uefi.html#uefi) with an [hrmpf](https://github.com/leahneukirchen/hrmpf/releases) image.

Boot to the hrmpf image, then connect to it from ssh. This allows you to perform the installation in a convenient setup.

## Variations from the guide

At [zpool creation step](https://docs.zfsbootmenu.org/en/latest/guides/void-linux/uefi.html#create-the-zpool), add flag to disable acess time `-O atime=off`.

At [void installation](https://docs.zfsbootmenu.org/en/latest/guides/void-linux/uefi.html#install-void), setup with quick mirrors like : `https://repo-de.voidlinux.org/current/`.

At [void basic configuration](https://docs.zfsbootmenu.org/en/latest/guides/void-linux/uefi.html#basic-void-configuration):

Locale, timezone and clock :
```sh
cat << EOF >> /etc/rc.conf
KEYMAP="fr_CH"
HARDWARECLOCK="UTC"
EOF
ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
```
Glibc locale :
```sh
cat << EOF >> /etc/default/libc-locales
en_GB.UTF-8 UTF-8
EOF
xbps-reconfigure -f glibc-locales
```

At the end of the tutorial, `reboot`, the perform some post installation steps.

## Post installation

Again, the first steps can be performed from ssh to have a more convenient working env.

Activate `dhcpcd` and `sshd` services :
```sh
ln -s /etc/sv/dhcpcd /var/service
ln -s /etc/sv/sshd /var/service
```
Create a fresh user :
```sh
useradd toto
passwd toto
```

Get your ip with `ip a` and ssh into your new system, then switch to root.

Setup `doas` :

```sh
xbps-install opendoas helix
usermod -aG wheel toto dialout
cat << EOF >> /etc/doas.conf
permit persist :wheel
permit nopass keepenv root
EOF
```

This minimal setup allows you to follow the void handbook from a normal user, use `doas` command to elevate privileges.

Perform system update : `doas xbps-install -Su`

## Variations from void handbook

User shell, install fish : `doas xbps-install fish`, then set the shell `doas chsh -s /bin/fish toto`, then re ssh to get in new shell.

Install cron service :
```sh
doas xbps-install cronie
doas ln -s /etc/sv/crond /var/service
```

Trim, zpool is already to autotrin, let this setup in place.

Ntp :
```sh
doas xbps-install ntp
doas ln -s /etc/sv/ntpd /var/service
```

## Dotfiles

To setup this repository dotfiles :

```sh
doas xbps-install git
# Configure your ssh key
git clone git@github.com:fuzoh/dotdot.git
# Install these before stowing dotfiles
doas xbps-install bat btop dunst fish-shell foot git glow helix starship topgrade tofi Waybar zathura curl stow eza pass gitui task wireguard wireguard-tools zoxide keepassxc qt5-wayland qt6-wayland wl-clipboard polkit-gnome Thunar wtype libnotify xdg-utils fastfetch fd xtools wev vsv vdpauinfo nvtop usbmuxd tesseract-ocr tesseract-ocr-eng tesseract-ocr-fra syncthing slurp grim qpdfview qpwgraph qrencode pass imv jq hurl nwg-look jpegoptim qpdf poppler ImageMagick impala
# Create these directories
fd -d1 -td . .config/ -x mkdir -p ~/{}
mkdir ~/.local/bin ~/.local/share/applications ~/.local/share/icons ~/.icons
# Launch stow one time to see conflicts
cd dotdot
stow .
# Remove conflicting files then stow again
# Check that all dotfiles are present in .config
```

Insatall some complementary tools :

- [fnm](https://github.com/Schniz/fnm?tab=readme-ov-file#using-a-script-macoslinux)
- [Go](https://go.dev/doc/install)
- [xdeb](https://github.com/xdeb-org/xdeb?tab=readme-ov-file#usage)
- [asdbctl](https://github.com/juliuszint/asdbctl)
- [Rust](https://rust-lang.org/tools/install/)
- Rust compiled tools : `atuin cargo-update clipvault codesnap-cli doxx du-dust dysk git-commit-stats git-graph harper-ls names oha onefetch oxker rage repgrep ripgrep_all taplo-cli television tokei typestyle`
Sethup [hyprland](https://github.com/Encoded14/void-extra) repos, then :

```sh
doas xbps-install hyprcursor hypridle hyprland hyprland-qtutils hyprlock xdg-desktop-portal-hyprland hyprpicker
```

Setup [rosé pine](https://github.com/rose-pine/cursor) cursors. Need to generate an appropriate hyprcursor theme with utils. Also remeber to setup a overide for flatpaks to allow them to read theme.

Quick remove unnecessary agetty services : `doas rm -f /var/service/agetty-tty{3,4,5,6}`.
