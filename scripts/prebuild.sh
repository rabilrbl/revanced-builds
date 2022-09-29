#!/bin/bash

# if downloads directory does not exist, create it
if [ ! -d "downloads" ]; then
    mkdir downloads
fi

req() {
    url=$1 extra_args=$2
    # curl request with User-Agent
    curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0" $2 $url
}

fetch_revanced_release() {
    repo_name=$1 asset_no=$2 file_name=$3
    wget $(req https://api.github.com/repos/revanced/$repo_name/releases/latest | jq -r ".assets[$asset_no].browser_download_url" | tr -d '"') -O downloads/$file_name
}

# Download latest revanced-cli
fetch_revanced_release revanced-cli 0 revanced-cli.zip

# Download latest revanced-patches
fetch_revanced_release revanced-patches 0 revanced-patches.zip
