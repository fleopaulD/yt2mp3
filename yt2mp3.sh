#!/bin/bash -e

MUSIC_EXPORT_PATH="$HOME/Musique/Youtube/"

if ! [[ -e /tmp/yt-dlp-updated ]]; then
    echo "Mise à jour de yt-dlp..."
    sudo yt-dlp -U > /dev/null
    touch /tmp/yt-dlp-updated
fi

echo """
░▒█░░▒█░▄▀▀▄░█░▒█░▀█▀░█░▒█░█▀▀▄░█▀▀░░░▀█▀░▄▀▀▄░░░▒█▀▄▀█░▒█▀▀█░█▀▀█
░▒▀▄▄▄▀░█░░█░█░▒█░░█░░█░▒█░█▀▀▄░█▀▀░░░░█░░█░░█░░░▒█▒█▒█░▒█▄▄█░░▒▀▄
░░░▒█░░░░▀▀░░░▀▀▀░░▀░░░▀▀▀░▀▀▀▀░▀▀▀░░░░▀░░░▀▀░░░░▒█░░▒█░▒█░░░░█▄▄█
"""

while true; do
    echo "Coller l'adresse Youtube de la musique à télécharger [CTRL+C pour quitter]"
    read -rp " -> " url

    yt-dlp -x --audio-format mp3 --audio-quality 0 \
        --embed-thumbnail \
        -o "$MUSIC_EXPORT_PATH/%(title)s.%(ext)s" \
        --quiet \
        --progress --progress-template "download-title:%(info.id)s-%(progress.eta)s"\
        --no-warnings\
        "$url"

    echo "\o/ Le fichier a été correctement téléchargé dans $MUSIC_EXPORT_PATH"
    echo
    sleep 1
done