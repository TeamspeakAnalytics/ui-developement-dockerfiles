# teanspeak-analytics: ui-developement-dockerfiles

Docker Compose files to spawn up a develop environment for the [TeamspeakAnalytics/webapp](https://github.com/TeamspeakAnalytics/webapp)

## System Requirements

#### Linux / LinuxVM (Recommended)

- docker and docker-compose installed

#### Windows steps (not tested)

1. Open the `docker-compose.yml` file  
2. change this:
      
       ts3db:
         image: mariadb:10.3
         restart: always
         environment:
           MYSQL_ROOT_PASSWORD: example1Passwd
           MYSQL_DATABASE: teamspeak
         volumes:
           - ./drives/ts3db:/var/lib/mysql
   
   to this: 
   
       ts3db:
         image: mariadb:10.3
         restart: always
         environment:
           MYSQL_ROOT_PASSWORD: example1Passwd
           MYSQL_DATABASE: teamspeak
           
    **Please keep in mind that the Teamspeak Server Database is not persisted to the hard drive!** This
    means if the container gets deleted the Teamspeak server gets reset. 

## Install Instructions

1. CD into the project folder
2. Copy `docker-compose_default.yml` to `docker-compose.yml`  
   (`$ cp docker-compose_default.yml docker-compose.yml`)
3. Run `$ sudo docker-compose up -d`
4. Copy the privilege-key and the serveradmin password
5. Open the `docker-compose.yml` and set `services:analytics-service:environment:TS3_Password` and set it to the previously copied serveradmin password
6. Connect with an Teamspeak3 Client to `localhost` and use the privilege-key
7. Run `$ docker-compose stop`

## Run Instructions

- To run the develop environment just run `$ sudo docker-compose up`
- To stop the develop environment just press `<ctrl>`+ `c`
- If you want to reset the develop environment run `$ sudo docker-compose down` and delete the `drives` folder
