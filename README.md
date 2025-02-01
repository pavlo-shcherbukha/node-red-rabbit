# Node-Red and rabbitmq  and NoSQL couchdb

In this repo developend some simple examples how to integrate Node-Red,  RabbitMQ,  NoSQL CouchDB.
The main focus aimed to learning integration Node-Red with RabbitMQ. CouchDB is used as file storage with extended functionality.

## Used tools
- [Docker RabbitMQ](https://hub.docker.com/_/rabbitmq/)
- [Docker CouchDB](https://hub.docker.com/_/couchdb)
- [odered/node-red Docker image](https://hub.docker.com/r/nodered/node-red)
- [Docker Compose](https://docs.docker.com/compose/)


## Useful links

### Rabbit MQ

- [Rabbit tutorials](https://www.rabbitmq.com/tutorials)
- [habre](https://habr.com/ru/articles/434510/)
- [@mnn-o/node-red-rabbitmq 1.0.2](https://flows.nodered.org/node/@mnn-o/node-red-rabbitmq)
- [FlowFuse: Using AMQP with Node-RED](https://flowfuse.com/node-red/protocol/amqp/)

### CouchDB

- [node-red-contrib-cloudantplus 2.0.6](https://flows.nodered.org/node/node-red-contrib-cloudantplus)
- [Apache CouchDB® 3.4.2 Documentation](https://docs.couchdb.org/en/stable/)


## Flows Deccription
 
### flows.json 
Simple examples from [FlowFuse: Using AMQP with Node-RED](https://flowfuse.com/node-red/protocol/amqp/)
This is example is aimed to test node which I am using. 

### upoader.json 
Developed a simple my example with direct axchange.
The idea is from one flow uploading some file  using http and publish file binary  in queue.
The flow-consumner read binary file  from queue and store it into CouchDB as attachment. 

## Run it in docker composer

Node Red is running in container. All containers are starting  using docker-compose. The  Node-Red image is running from custom image which is described in **nodered.dockerile**. 
All necessary containers and environment variables are gathered on docker-compose file **docker-compose-nr.yaml**.

1. Change environment variables according to your configurations
Put is this variables parameters of your repository which wiil be cloned during docker build phase. In the same time it allow you enter into container and push your changes back to github repository.  Then **GIT_PSW** argument means github token which is using for https connection to github.



```yaml
  red-sender:
    # 1===
    #image: nodered/node-red
    #container_name: redsender
    build:
      context: ./
      dockerfile: nodered.dockerfile 
      args:
        GIT_USER: github username
        GIT_PSW: github token
        GIT_BRANCH: brnach name
        GIT_REPO:  githyb url without "https://"
        GIT_EMAIL: "your email"  for git config global

```

You can explicitly set up flow file which your want to run  by set up the environment variable **FLOWS**

```yaml

    environment:
      RABBITMQ_USER: "guest"
      RABBITMQ_PASSWORD: "guest"
      RABBITMQ_HOST: "rabbitmq"
      RABBITMQ_PORT: "5672"      
      COUCHDB_AUTH_TYPE: "COUCHDB_SESSION"
      COUCHDB_URL: "http://couchdb:5984"
      COUCHDB_USERNAME: "devadm"
      COUCHDB_PASSWORD: "qq" 
      FLOWS: "uploader.json"    
```

2. Build and run compose


```bash
    docker-compose -f  docker-compose-nr.yaml up --remove-orphans  --force-recreate --build -d
```

3. Stop compose

```bash

    docker-compose -f  docker-compose-nr.yaml start
```

4. Start has already builded compose

```bash
    docker-compose -f  docker-compose-nr.yaml stop
```

3. Store your changes in github

- Enter into **red-sender** container

```bash
    docker exec -it <container id> bash

```

- Change directory

```bash
    cd /data

```

- enter your git commands

```bash

    git status
    git add <filenamr>
    git commit -m "message"
    git push

```

