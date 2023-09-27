#!/usr/bin/bash

echo "Vérification de la dépendance yt-dlp..."
if ! [[ $(which yt-dlp) ]]; then
    read -rp "yt-dlp n'est pas installé. Installer ? [o/N] " ans
    if [[ $ans == "o" ]]; then
        sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp --quiet
        sudo chmod a+rx /usr/local/bin/yt-dlp
    fi
fi

echo "Vérification de la dépendance ffmpeg..."
if ! [[ $(which ffmpeg) ]]; then
    read -rp "ffmpeg n'est pas installé. Installer ? [o/N] " ans
    if [[ $ans == "o" ]]; then
        sudo apt update > /dev/null 2>&1 && sudo apt install -y ffmpeg > /dev/null 2>&1
    fi
fi

cd /tmp || exit 1

mkdir yt2mp3 && cd yt2mp3 || exit 1
wget https://github.com/fleopaulD/yt2mp3/archive/refs/heads/main.zip -O yt2mp3.zip
unzip yt2mp3.zip 
cd yt2mp3-main || exit 1
 
sudo cp yt2mp3.sh /usr/local/bin/yt2mp3 && sudo chmod +x /usr/local/bin/yt2mp3
cp "Youtube en MP3.desktop" "$HOME/Bureau/" && chmod +x "$HOME/Bureau/Youtube en MP3.desktop" 

cd /tmp || exit 1
rm -rf yt2mp3*