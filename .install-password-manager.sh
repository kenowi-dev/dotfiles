#!/bin/sh

# exit immediately if "op" is already in $PATH
command -v op >/dev/null 2>&1 && exit

distro=$(lsb_release -i | awk -F"\t" '{print $2}')

case "${distro}" in
Ubuntu)
    # As taken from https://support.1password.com/install-linux/#debian-or-ubuntu
    sudo -s \
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    gpg --yes --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" |
    tee /etc/apt/sources.list.d/1password.list
    mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | \
    tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --yes --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt update && sudo apt install 1password-cli --yes
    ;;
*)
    echo "unsupported distro: ${distro}"
    exit 1
    ;;
esac