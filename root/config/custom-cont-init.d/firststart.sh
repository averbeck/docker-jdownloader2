#!/bin/bash

APP_DIR=/app

# Create folders if they are missing
if [ ! -d "${APP_DIR}" ]; then
  mkdir -p "${APP_DIR}"
fi
if [ ! -d /downloads ]; then
  mkdir /downloads
fi

# Copy JDownloader2 to ${APP_DIR} if it's not already existent
if [ ! -f "${APP_DIR}"/JDownloader.sh ]; then
  cp /config/JDownloader.* "${APP_DIR}"/
fi

# Fix permissions
chown -R nobody:users /app
chmod -R g+rw /app

# Remove script after first run
rm -f /config/custom-cont-init.d/firststart.sh
