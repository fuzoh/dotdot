# Fresh void linux installation

Follow these instruction to install and configure [[installation#Void installation on ZFS root]].

## Some additions

### Udev rule for thunderbolt

* [Setup udev](https://wiki.archlinux.org/title/Thunderbolt#:~:text=plasma%2Dthunderbolt%20package-,Automatically%20connect%20any%20device,-Users%20who%20just) rule to accept thunderbold devices

### Xdeb to install `.deb` packages

* Install xdeb

### GearLever

For AppImages management [GearLever](https://flathub.org/apps/it.mijorus.gearlever)

### GPG

Import export gpg keys :

```fish
gpg --armor --export > public_keys.asc
gpg --armor --export-secret-keys > secret_keys.asc
gpg --export-ownertrust > trust_db.txt
# Securely transfer keys
gpg --import public_keys.asc
gpg --import secret_keys.asc
gpg --import-ownertrust trust_db.txt
```
