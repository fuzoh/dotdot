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
