#!/bin/bash

"${JAVA_HOME}"/bin/java -Xms64M -jar "${APP_HOME}"/JDownloader.jar -noerr -focus > "${APP_HOME}"/output.log 2> "${APP_HOME}"/error.log
