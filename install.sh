#!/usr/bin/bash -e

cd /tmp || exit 1

wget https://raw.githubusercontent.com/fleopaulD/yt2mp3/main/yt2mp3.sh

sudo cp yt2mp3.sh /usr/local/bin/yt2mp3
