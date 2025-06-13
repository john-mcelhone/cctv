#!/bin/bash

echo "Started recording at $(date)"

FILENAME="recording-$(date +%s).mp4"

ffmpeg -i "$RTSP_URL" -t 60 -vcodec copy "$FILENAME"

echo "Done recording. Saved as $FILENAME"
