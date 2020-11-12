NOT WORKING! WORK IN PROGRESS!!
=============
docker-compose-ebot (SSL branch)
================

Pre-Requisites
--------------
* Edit the .env file.

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

# eBotWeb specific settings 
DEFAULT_MAX_ROUND=15
DEFAULT_RULES=ebot_config
DEFAULT_OVERTIME_MAX_ROUND=6
DEFAULT_OVERTIME_STARTMONEY=10000
MODE=net
REFRESH_TIME=30

##################################################
# DO NOT CHANGE ANY SETTINGS AFTER THIS!
# MYSQL for eBot and eBotWeb
MYSQL_HOST=mysql
MYSQL_PORT=3306

# eBot
EBOT_PROTO=https://
EBOT_PORT=12360
DEMO_DOWNLOAD=true
DEMO_FOLDER=/ebot/demos
LOG_FOLDER=/ebot/logs
NODE_STARTUP_METHOD=none

# SSL
SSL_ENABLED=true
SSL_CERTIFICATE_PATH=/ebot/ssl/fullchain.cer

# Forever (eBot daemon)
FOREVER_SSL=TRUE
FOREVER_SECUREUPLOAD=TRUE
````

Run
---
`docker-compose up -d`

Quick start
-----------
* Connect to the running eBot web interface at `http://$hostip/`

* Connect to the admin eBot web interface at `http://$hostip/admin.php`

Thanks to
-------
* destr0
* carazzim0
* jffz
* DrumSlayers
* CounterStrafe
