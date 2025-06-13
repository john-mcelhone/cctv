cat > entrypoint.sh <<'EOF'
#!/bin/bash

echo "Started recording at $(date)"

FILENAME="recording-$(date +%s).mp4"

ffmpeg -rtsp_transport tcp -i "$RTSP_URL" -t 60 -c copy "$FILENAME"

ftp -inv "$FTP_HOST" <<EOT
user $FTP_USER $FTP_PASS
put $FILENAME
bye
EOT

echo "Done recording + FTP uploaded $FILENAME"
EOF
