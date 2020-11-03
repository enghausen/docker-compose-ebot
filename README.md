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
#NETWORK
EBOT_PROTO=http://
IP=<External_IP>
DOCKER_NETWORK=172.%.%.%

#EBOT USER
EBOT_ADMIN_USER=admin
EBOT_ADMIN_PASS=MySuperSecretEbotPassword

#EBOT SETTINGS (true or false)
REMIND_RECORD=true
DAMAGE_REPORT=false

#MAPS
MAPS=de_dust2,de_inferno,de_mirage,de_nuke,de_overpass,de_train,de_vertigo

#EBOT WEB SETTINGS
DEFAULT_RULES=ebot_config

#MYSQL (remember to change the username in init.sql if you change the MYSQL_USER)
MYSQL_DATABASE=ebotv3
MYSQL_USER=ebotv3
MYSQL_PASSWORD=MySuperSecretDBPassword
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
