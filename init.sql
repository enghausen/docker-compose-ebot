UPDATE mysql.user SET Host='172.%.%.%' WHERE Host='%' AND User='ebotv3';
UPDATE mysql.db SET Host='172.%.%.%' WHERE Host='%' AND User='ebotv3';
FLUSH PRIVILEGES;
