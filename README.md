docker-compose-ebot
================

Testet on
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
* Connect to the running eBot web interface at `https://$domain/`
* Connect to the admin eBot web interface at `https://$domain/admin.php`

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

Thanks to
-------
* destr0
* carazzim0
* jffz
* DrumSlayers
* CounterStrafe
