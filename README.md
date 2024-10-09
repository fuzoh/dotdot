# dotdot

> Personal dotfiles, actually working on [void-linux](https://voidlinux.org/).
> You can apply them with [stow](https://www.gnu.org/software/stow/)

Clone this repo in your home `cd && git clone <REPO_URL>`.
Use `stow .` from the root folder of the cloned repo.

*Maybe you will wand to use `stow . --adopt` then `git diff` to compare your dotfiles with these one.

## Tips and triks

### Network

[Network](https://docs.voidlinux.org/config/network/networkmanager.html) can be easyly configured.
Install network manager for fully automated network configuration.
Then, it is possible to use nmtui to manage networks with a simple interface.

### Fonts

You can copy fonts in your user `.fonts` directory. Then use `fc-cache -r` to rebuild font cache.

### doas

[doas tutorial](https://flak.tedunangst.com/post/doas-mastery)

### Apple studio display brightness

To control studio display brightness, use [asdbctl](https://github.com/juliuszint/asdbctl).
Clone the repo, build the rust binary with `--release` flag. Then copy it to `.bin`.

### Hyprland update

[see infos on void-hyprland repo](https://github.com/Makrennel/hyprland-void)

Don't forget update void-packages sources.
Sometimes you will need to remove the old installed packages and reinstall to updates the libraries paths. Use `xbps-remove`.

### Update thorium with .desktop (same procedure for other .AppImage apps)

You can find [thorium relases here](https://github.com/Alex313031/thorium/releases).

You can get the right AppImage from this release page. Use AVX2 build if your CPU supports it.
Then, you will need to extract the app image to retrieve the .desktop file.

```sh
Thorium.....xxx.AppImage --appimage-extract # This will create a squashfs-root
# You can now copy the .AppImage from the squashfs-root to your app folder, for example :
cp ./squashfs-root/thorium-browser.desktop ~/.local/share/applications/
# Then, you can remove the squashfs, set the AppImage executable, and move it to one of your binary folders
rm -Rf ./squashfs-root
chmod +x ./Thorium...xxx.AppImage
mv ./Thorium...xxx.AppImage ~/.bin/thorium
```

### Tessen for pass search

```sh
curl -LO https://git.sr.ht/~ayushnix/tessen/refs/download/v2.2.3/tessen-2.2.3.tar.gz
tar xvzf tessen-2.2.3.tar.gz
cd tessen-2.2.3/
sudo make install
```

## Todo

### Pass configuration

### Gpg backup, export, and restore
