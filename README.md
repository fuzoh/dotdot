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

### Video recording and edition

To make efficient recordings and video edition without using much CPU but with 4k quality, i use :
- [wl-screenrec](https://github.com/russelltg/wl-screenrec)
- [ffmpeg](https://git.ffmpeg.org/ffmpeg.git)

With *wl-screenrec* I record my screen directly from the GPU buffers, and encode it in [AV1](https://aomediacodec.github.io/av1-spec/av1-spec.pdf)
with the hardware encoder available with my CPU.
Then, I use *ffmpeg* to cut and merge videos with the `--copy` flag to avoid reencoding, this allow instant cuts and megrges.

```
# Recording with wl-screenrec
wl-screenrec -o DP-1 --codec av1 --audio --low-power off --filename path_to_file.mp4
# -o to select monitor to record
# --low-power seems to avoid problems in my setup

# Cut the video with ffmpeg
ffmpeg -i filename.mp4 --ss 00:01:00 -to 00:12:02 -c copy output_file.mp4
# -ss specify the start timecode (wideo before will be cut)
# -to specify the end timecode (video after will be cut)
# -c copy tells ffmpeg to not reencode the video

# Assemble multiple videos
# Create a text file with all the paths to the videos you want to merge
echo "file 'part1.mp4'\nfile 'part2.mp4'" > videos.txt
# Perform merge
ffmpeg -f concat -i videos.txt -map 0:v -map 0:a -c copy merged_video.mp4
```

To edit the audio and apply compression and equalisation :
```
# Extract the audio file from the video
ffmpeg -i my_video.mp4 -vn -acodec copy audio.aac

# Then edit the audio file in your daw, apply compression, equalization... Render a new audio file.

# Insert the new audio file as the video audio track
ffmpeg -i my_video.mp4 -i my_new_audio.aac -c:v copy -map 0:v:0 -map 1:a:0 video_with_audio.mp4
```

### Installing deb packages on void linux

*WARNING, you may break your system if you ignore errors... be careful*

This is a last resort solution, you should favour using oficial package manager, flatpack or other native package system.

We will use [xdeb](https://github.com/xdeb-org/xdeb), a script that allows to convert a .deb to an xbps template.

```shell
# Generate a template
xdeb -Sedf <DEB_PACKAGE_NAME>.deb
# The type the xbps-install command given by the xdeb command
```

**If xdeb gives you an error, carfully consider it to avoid breaking your system.**

### Installing satty for screenshots

```sh
git clone --branch <TAG> git@github.com:gabm/Satty.git
PREFIX=~/.local make install
```

## Todo

### Pass configuration

### Gpg backup, export, and restore
