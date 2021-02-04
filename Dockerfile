# Builds a docker GUI image
# https://github.com/linuxserver/docker-baseimage-guacgui
FROM lsiobase/guacgui

LABEL maintainer=ghostcode1337


#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set environment variables (change them if you like)

# Default GUI app name
ENV APPNAME="JDownloader2"

# User/Group ID for GUI app
ENV PUID=99
ENV PGID=100

# Default resolution
ENV WIDTH=1280
ENV HEIGHT=720

# Choose java home from base image
ENV JAVA_HOME="/usr/lib/jvm/java-15-openjdk-amd64"

# Define app directory
ENV APP_HOME="/app"


#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################

RUN \
    export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive \
    # Install packages needed for app
 && echo 'deb http://archive.ubuntu.com/ubuntu groovy main universe restricted' > /etc/apt/sources.list \
 && echo 'deb http://archive.ubuntu.com/ubuntu groovy-updates main universe restricted' >> /etc/apt/sources.list \
 && apt-get update && apt-get install --no-install-recommends -y \
      firefox \
      openjdk-15-jre \
      xz-utils \
      -o APT::Immediate-Configure=0 \
 && rm -rf /var/lib/apt/lists/* \
    # Change RDP config name
 && sed -i "s/\"myconfig\"/\"${APPNAME}\"/" /defaults/noauth-config.xml


#########################################
##          GUI APP INSTALL            ##
#########################################

# Install steps for X app
COPY /root /


#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

# Folder for jdownloader2 application
VOLUME ["/app"]

# Folder for downloads
VOLUME ["/downloads"]

# RDP
EXPOSE 3389

# Web interface
EXPOSE 8080
