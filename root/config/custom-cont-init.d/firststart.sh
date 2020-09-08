#!/usr/bin/with-contenv bash

# Create folders if they are missing
if [ ! -d "${APP_HOME}"/cfg ]; then
  mkdir -p "${APP_HOME}"/cfg
fi
if [ ! -d /downloads ]; then
  mkdir /downloads
fi

# Copy JDownloader2 to ${APP_HOME} if it's not already existent
if [ ! -f "${APP_HOME}"/JDownloader.jar ]; then
  cp /config/jd2/JDownloader.jar "${APP_HOME}"/
  cp /config/jd2/org.jdownloader.settings.* "${APP_HOME}"/cfg/
fi

# Fix permissions
chown -R ${PUID}:${PGID} /{${APP_HOME},downloads}
chmod -R g+rw /{${APP_HOME},downloads}

chmod +x /config/jd2/jd2launcher.sh

# Remove script after first run
rm -f /config/custom-cont-init.d/firststart.sh
