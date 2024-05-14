# Void linux

## Installation

With UEFI, dont forget to create a FAT32 partition for the EFI system. mounted on `/boot/efi`.

## Network

[Network](https://docs.voidlinux.org/config/network/networkmanager.html) can be easyly configured.
Install network manager for fully automated network configuration.
Then, it is possible to use nmtui to manage networks with a simple interface.

## Fonts

You can copy fonts in your user `.fonts` directory. Then use `fc-cache -r` to rebuild font cache.

## doas

[doas tutorial](https://flak.tedunangst.com/post/doas-mastery)

## Apple studio display brightness

To control studio display brightness, use [asdbctl](https://github.com/juliuszint/asdbctl).
Clone the repo, build the rust binary with `--release` flag. Then copy it to `.bin`.

## Hyprland update

[see infos on void-hyprland repo](https://github.com/Makrennel/hyprland-void)

Don't forget update void-packages sources.
