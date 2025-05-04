# Fresh void linux installation

This repo contains some scripts to simplify the setup of a new void installation.
When completed, all packages needed to use with the dotfiles provided in this repo will be available.

1. Install a new void system
  - Use the official [void installer](https://docs.voidlinux.org/installation/index.html#downloading-installation-media)
  - For easy root on zfs installation, use [void-pi](https://github.com/sdbtools/void-pi)
2. Login to your newly created user
3. Setup [[#Doas]]
3. Clone this repo in your home `git clone https://github.com/fuzoh/dotdot`
4. Cd in the repo, and stow the configuration files `cd dotdot && stow .`
5. Launch the package installation scripts `doas others/packages_installation.sh`
6. Proceed to [[#Postinstallation]] steps

## Doas

```bash
# Copy the configuration (as root)
xbps-install doas
cp others/doas.conf /etc/doas.conf
```

## Postinstallation

```bash

```

* [Setup udev](https://wiki.archlinux.org/title/Thunderbolt#:~:text=plasma%2Dthunderbolt%20package-,Automatically%20connect%20any%20device,-Users%20who%20just) rule to accept thunderbold devices
* Install xdeb

### Activate runit services

### Switch to mainline kernel series
