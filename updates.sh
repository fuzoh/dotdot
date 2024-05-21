#!/bin/bash

doas xbps-install -Su

rustup self update

rustup update

cargo install-update --all

volta install node

volta install npm

volta install pnpm

flatpak update
