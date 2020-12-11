docker-compose-ebot-ssl
================

Known bugs
--------------
* **Demo upload is not working with CSay**  
CSay (Latest version: 3.2.6): http://www.esport-tools.net/download/CSay-CSGO.zip - Does not support SSL upload. I created a ticket on the eBot-CSGO repo: https://github.com/deStrO/eBot-CSGO/issues/169 and hoping for a updated CURL version with SSL support in the CSay plugin.  
**Workaround:** See https://github.com/enghausen/docker-compose-ebot-ssl#demo-upload
* **eBot does not exec the server.cfg when match end**  
If the value of 90 or higher is used for tv_delay (like tv_delay 91) - This seems to be a bug in the eBot-CSGO code and due to some kind of RCON timeout. I tried to fix it with no luck.

Introduction
--------------
I wanted to create a pure SSL ebot and ebotweb docker image. I ended up with some few improvements and bug fixes along the way. I am piggybacking on github users as jffz (where I forked the docker images from), DrumSlayers and CounterStrafe for improvements and of course the creators of ebot.  
I use my own forked repositories for everything. I made some small changes for ebot and ebotweb to support SSL and a bigger change to add support for a "secure upload" feature. 
  
**docker-ebot-ssl:** https://github.com/enghausen/docker-ebotweb-ssl  
**docker-ebotweb-ssl:** https://github.com/enghausen/docker-ebotweb-ssl  
**eBot-CSGO:** https://github.com/enghausen/eBot-CSGO  
**eBot-CSGO-Web:** https://github.com/enghausen/eBot-CSGO-Web  

Improvements
--------------
* Cleanup in Docker files and updated to latest supported software versions. I also added some more software for Acme.sh and Docker.
* Cleanup and streamline in the entrypoint.sh files. This include identical SED command in both files.
* Removed some php bugs and some files not getting updated correct.
* Support for custom maps for both ebot and ebotweb.
* Support for alot more customization in the ebot and ebotweb config files.
* Running the websocket_server.js (ebot) with forever to increase stability
* Added acme.sh to get certificates and automatic renewal when the time comes (crontab). This also restarts Apache (ebotweb) and the websocket_server.js (ebot) to reload the new certificate.
* Added wait-for-it.sh to ebot to make sure the ebotweb is online (to make sure it got the new certificate).
* Automatic getting the EXTERNAL_IP for the domain (ebot). This could potentially make some trouble for some use cases.
* Increased the maximum .dem filesize from 200MB to 1024MB in websocket_server.js
* A "secure upload" feature in the websocket_server.js

Secure Upload
--------------
I took the time to make a major change in the websocket_server.js (ebot) to make a "secure upload" feature. This means this services now perform a IP check to insure you are allow to upload a .dem to the https://$domain:12360/upload - If disabled everyone can just `curl -F "file=@FILE.dem" https://$DOMAIN:12360/upload` and upload some files to your server.  
This could also be handled on the network/firewall level. But this is not possible with every cloud/VPS provider. Thats why I needed this.  
To allow a remote host to upload files to your ebot server you can define a IP or IP Range in the .env file. Look for the `IPCUSTOMRANGE1=8.8.8.8/32`  
To disable this feature just change `FOREVER_SECUREUPLOAD=TRUE` to `FOREVER_SECUREUPLOAD=FALSE`

Tested on
--------------
* Ubuntu 20.04.1 LTS  
* Docker version 19.03.13, build 4484c46d9d  
* docker-compose version 1.27.4, build 40524192  

Pre-Requisites
--------------
* Docker Engine (19.03.0+) - Installation instructions: https://docs.docker.com/engine/install/ubuntu/
* Docker Compose - Installation instructions: https://docs.docker.com/compose/install/
* Git - Installation instructions: `sudo apt-get -y install git`
* Edit the DOMAIN in the .env file.

Installation
---------
* `git clone https://github.com/enghausen/docker-compose-ebot-ssl.git`
* Edit the .env file and as a minimum change the DOMAIN
* `docker-compose up -d`
* Connect to the running eBot web interface at `https://$DOMAIN/`
* Connect to the admin eBot web interface at `https://$DOMAIN/admin.php`

Settings
---------
Edit the following settings in [.env](.env) to your needs.

#### .env
````
##################################################
# Change these settings
# Domain name - This is needed for SSL to work
DOMAIN=ebot.domain.com

# eBotWeb Admin
EBOT_ADMIN_USER=admin
EBOT_ADMIN_PASS=MySuperSecretEbotPassword
EBOT_ADMIN_MAIL=admin@ebot

##################################################
# You may change these settings
# MYSQL
MYSQL_DATABASE=ebotv3
MYSQL_USER=ebotv3
MYSQL_PASSWORD=MySuperSecretDBPassword

# Shared settings (eBot and eBotWeb)
# Maps
MAPS=de_dust2,de_inferno,de_mirage,de_nuke,de_overpass,de_train,de_vertigo

# Toornament
TOORNAMENT_ID=
TOORNAMENT_SECRET=
TOORNAMENT_API_KEY=
TOORNAMENT_PLUGIN_KEY=

# PHP timezone
TIMEZONE=Europe/Copenhagen

# eBot specific settings (see some more details on https://github.com/deStrO/eBot-CSGO/wiki/Usage)
DELAY_BUSY_SERVER=120
NB_MAX_MATCHS=0
PAUSE_METHOD=nextRound
LO3_METHOD=restart
KO3_METHOD=restart
REMIND_RECORD=true
DAMAGE_REPORT=false
USE_DELAY_END_RECORD=true
COMMAND_STOP_DISABLED=false
RECORD_METHOD=matchstart
DELAY_READY=true
# Custom IP Range for secureUpload
IPCUSTOMRANGE1=8.8.8.8/32
IPCUSTOMRANGE2=8.8.8.8/32
IPCUSTOMRANGE3=8.8.8.8/32

# eBotWeb specific settings 
DEFAULT_MAX_ROUND=15
DEFAULT_RULES=ebot_config
DEFAULT_OVERTIME_MAX_ROUND=3
DEFAULT_OVERTIME_STARTMONEY=10000
MODE=net
REFRESH_TIME=30
````

Demo upload
-------

Toornament
-------
This is also tested and working with https://www.toornament.com/


Thanks to
-------
* destr0
* carazzim0
* jffz
* DrumSlayers
* CounterStrafe
