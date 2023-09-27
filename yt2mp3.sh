#!/bin/bash -e

if ! [[ $(which yt-dlp) ]]; then
    read -rp "yt-dlp n'est pas installé. Installer ? [o/N] " ans
    if [[ $ans == "o" ]]; then
        sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp --quiet
        sudo chmod +x /usr/local/bin/yt-dlp
    fi
fi

if ! [[ $(which ffmpeg) ]]; then
    read -rp "ffmpeg n'est pas installé. Installer ? [o/N] " ans
    if [[ $ans == "o" ]]; then
        sudo apt update > /dev/null 2>&1 && sudo apt install -y ffmpeg > /dev/null 2>&1
    fi
fi

if ! [[ -e /tmp/yt-dlp-updated ]]; then
    echo "Mise à jour de yt-dlp..."
    yt-dlp -U > /dev/null
    touch /tmp/yt-dlp-updated
fi
echo """
░▒█░░▒█░▄▀▀▄░█░▒█░▀█▀░█░▒█░█▀▀▄░█▀▀░░░▀█▀░▄▀▀▄░░░▒█▀▄▀█░▒█▀▀█░█▀▀█
░▒▀▄▄▄▀░█░░█░█░▒█░░█░░█░▒█░█▀▀▄░█▀▀░░░░█░░█░░█░░░▒█▒█▒█░▒█▄▄█░░▒▀▄
░░░▒█░░░░▀▀░░░▀▀▀░░▀░░░▀▀▀░▀▀▀▀░▀▀▀░░░░▀░░░▀▀░░░░▒█░░▒█░▒█░░░░█▄▄█
"""

echo "Coller l'adresse Youtube de la musique à télécharger"
read -rp " -> " url

yt-dlp -x --audio-format mp3 --audio-quality 0 \
       --embed-thumbnail \
       -o "$HOME/YouTube/%(title)s.%(ext)s" \
       --quiet \
       --progress --progress-template "download-title:%(info.id)s-%(progress.eta)s"\
       --no-warnings\
       "$url"

echo "Terminé \o/"
sleep 2