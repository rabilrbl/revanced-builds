#!/bin/bash

req() {
    url=$1
    # curl request with User-Agent
    curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0" $url
}

