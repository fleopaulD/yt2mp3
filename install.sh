#!/usr/bin/bash

cd /tmp || exit 1

mkdir yt2mp3 && cd yt2mp3 || exit 1
wget https://github.com/fleopaulD/yt2mp3/archive/refs/heads/main.zip -O yt2mp3.zip
unzip yt2mp3.zip 
cd yt2mp3-main || exit 1
 
sudo cp yt2mp3.sh /usr/local/bin/yt2mp3 && sudo chmod +x /usr/local/bin/yt2mp3
cp "Youtube en MP3.desktop" "$HOME/Bureau/"

cd /tmp || exit 1
rm -rf yt2mp3*