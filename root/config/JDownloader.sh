#!/usr/bin/with-contenv bash

APP_DIR=/app

exec "${JAVA_HOME}"/bin/java -Xms64M -jar "${APP_DIR}"/JDownloader.jar -noerr -console > "${APP_DIR}"/output.log 2> "${APP_DIR}"/error.log
