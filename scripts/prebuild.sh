#!/bin/bash

# if downloads directory does not exist, create it
if [ ! -d "downloads" ]; then
    mkdir downloads
fi

req() {
    url=$1
    # curl request with User-Agent
    curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0" $url
}


# Download latest revanced-cli
wget $(req https://api.github.com/repos/revanced/revanced-cli/releases/latest | jq .assets[0].browser_download_url | tr -d '"') -O "downloads/revanced-cli.jar"

# Download latest revanced-patches
wget $(req https://api.github.com/repos/revanced/revanced-patches/releases/latest | jq .assets[1].browser_download_url | tr -d '"') -O "downloads/revanced-patches.jar"

