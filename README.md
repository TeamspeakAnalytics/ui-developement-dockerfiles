# ui-developement-dockerfiles

Docker Compose files to spawn up a develop enviroment for the [TeamspeakAnalytics/webapp](https://github.com/TeamspeakAnalytics/webapp)

## System Requirements

- Linux or LinuxVM (because docker for windows doesn't work well with symlinks)

## Install Instructions

1. CD into the project folder
2. Install docker and docker-compose
3. Run `$ sudo docker-compose up -d`
4. Copy the privilege-key and the serveradmin password
5. Open the `docker-compose.yml` and set `services:analytics-service:environment:TS3_Password` and set it to the previously copied serveradmin password
6. Connect with an Teamspeak3 Client to `localhost` and use the privilege-key
7. Run `$ docker-compose stop`

## Run Instructions

- To run the develop enviroment just run `$ sudo docker-compose up`
- To stop the develop enviroment just press `<ctrl>`+ `c`
- If you want to reset the develop enviroment run `$ sudo docker-compose down` and delete the `drives` folder