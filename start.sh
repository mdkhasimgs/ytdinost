#!/bin/bash

# Replace with your YouTube Stream Key (from Render env variable)
STREAM_KEY=${STREAM_KEY}

# Google Drive direct link to video
VIDEO_URL="https://drive.google.com/uc?export=download&id=YOUR_FILE_ID"

# Download video if not already present
if [ ! -f dino.mp4 ]; then
  echo "Downloading Dino video from Google Drive..."
  curl -L -o dino.mp4 "$VIDEO_URL"
fi

# Start streaming loop
ffmpeg -re -stream_loop -1 -i dino.mp4 \
  -c:v libx264 -preset veryfast -b:v 2500k -maxrate 2500k -bufsize 5000k \
  -c:a aac -ar 44100 -b:a 128k -f flv \
  rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY
