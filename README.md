# learnamqp - Learing Python Pika and rabbit MQ. Simple prototype.

## Short description


## Used tools
- [Docker RabbitMQ](https://hub.docker.com/_/rabbitmq/)
- [Docker CouchDB](https://hub.docker.com/_/couchdb)
- [RedHat  Python 3.9  container for running various Python applications](https://catalog.redhat.com/software/containers/ubi9/python-39/61a61032bfd4a5234d59629e)
- [Docker Compose](https://docs.docker.com/compose/)
- [Pika Python library for Rabbit MQ](https://pypi.org/project/pika/)
- [IBM Cloudant library for Cloudant and CouchDB](https://cloud.ibm.com/apidocs/cloudant?code=python)

- [What is AMQP](https://flowfuse.com/node-red/protocol/amqp/)

## Useful links

[Docker RabbitMQ](https://hub.docker.com/_/rabbitmq/)
[Rabbit tutorials](https://www.rabbitmq.com/tutorials)
[habre](https://habr.com/ru/articles/434510/)
[Getting Started with RabbitMQ and Python: A Practical Guide. Docker compose](https://dev.to/felipepaz/getting-started-with-rabbitmq-and-python-a-practical-guide-57fi)

- Cloudant

https://docs.couchdb.org/en/stable/
https://pypi.org/project/ibmcloudant/#authentication-with-environment-variables
https://cloud.ibm.com/apidocs/cloudant?code=python


## An Architecture of the prototype

## Run it locally

## Run it in docker composer

docker-compose -f  docker-compose-nr.yaml up --remove-orphans  --force-recreate --build -d
docker-compose -f  docker-compose-nr.yaml up --remove-orphans  --force-recreate --build -d
--remove-orphans

docker-compose -f  docker-compose-nr.yaml start
docker-compose -f  docker-compose-nr.yaml stop


