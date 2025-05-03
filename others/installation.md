# Void installation on ZFS root

Follow the guide from [ZBM](https://docs.zfsbootmenu.org/en/latest/guides/void-linux/uefi.html#uefi) with an [hrmpf](https://github.com/leahneukirchen/hrmpf/releases) image.

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
usermod -aG wheel toto
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




## Dotfiles

