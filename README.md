### JDownloader2

JDownloader2 docker container with a built-in browser based gui


#### Install

You can run this docker with the following command:

```
docker run -d \
  --name="JDownloader2" \
  -e HEIGHT="720" \
  -e WIDTH="1280" \
  -e TZ=Europe/Berlin \
  -v /path/to/jdownloader:/app:rw \
  -v /path/to/downloads:/downloads:rw \
  -p XXXX:8080 \
  docker-jdownloader2
```

#### Setup Instructions:

- Replace "/path/to/config" with your choice of folder location. That is where all of your configuration and library files will reside, so you won't lose data when you update, reinstall, etc.
- Replace "XXXX" with your choice of port.
- You can change the screen resolution by modifying the WIDTH and HEIGHT variables.
- Ctrl-Alt-Shft will bring up the menu that allows changing input options, as well as controlling the clipboard
- In order to use the built-in browser for manual recaptcha solving, go to advanced settings, find the following two settings: 1) `GeneralSettings: Browser Command Line` and 2) `BrowserCaptchaSolver: Browser Commandline` and change both values to the following: `[ "/usr/bin/firefox", "%s" ]`

To access the GUI, point your web browser to http://SERVERIP:PORT/#/client/c/JDownloader2 (Replace SERVERIP and PORT with your values)

JDownloader 2 also has a webserver accessible through my.jdownloader.org


#### Environment Variables

The dockergui image uses serveral optional enviromnet variable. All the ones listed in the example above plus the following:

##### `TZ`
This environment variable is used to set the timezone of the container.

You can change the timezone to yours according to the list here: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

#### Changelog:
- 2021-02-01 - Updated to OpenJDK 15 and groovy sources.
- 2020-08-09 - Updated to OpenJDK 14 and focal sources. Fixed focus bug.
- 2020-04-18 - Switched base image and made JDownloader install itself from .jar file on first run
- 2016-06-08 - Added firefox for recaptcha through the webgui (See instructions above on settings)
- 2016-01-08 - Fixed permissions for downloaded files. Should work better for samba shares.

#### Build from docker file (Info only, not required.):

```
git clone --depth=1 https://github.com/averbeck/docker-jdownloader2.git
cd docker-jdownloader2
docker build -t docker-jdownloader2:latest .
```
