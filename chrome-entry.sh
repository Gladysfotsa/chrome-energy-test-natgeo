#!/bin/bash

# Use a default URL if none is provided
URL="${URL_TO_VISIT:-https://www.nationalgeographic.com}"

echo "Launching Google Chrome with URL: $URL"
google-chrome --no-sandbox --headless --disable-gpu --remote-debugging-port=9222 "$URL" &

sleep 300
