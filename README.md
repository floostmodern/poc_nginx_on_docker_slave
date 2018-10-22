Proof of concept: An nginx-led ambassador on the `docker-slave`
==

Architecture
--

This proof of concept works with three containers:

- An ambassador that runs with nginx
- A server app that should be accessed through http://ldn.skylarkcms.com:8000 and http://ldn.skylarkcms.com:8001 
- Another server app that should be accessed through http://ldn.skylarkcms.com:8000 and http://ldn.skylarkcms.com:8001

How to run it
--

Here are the steps:

0. `make hard-reset` and `make install-dependencies` to reset the environement and install `mustache`
1. `make start-ambassador` : creates the `ambassador` docker network and the `ambassador` containers
1. `make run-jenkins-ams`: simulate a Jenkins build for the `ams` server app
1. `make run-jenkins-ldn`: sumulate another Jenkins build, this time for the `ldn` server app

This sets up all the containers

Then, run `queries-ams` and `queries-ldn` to the servers on both ports.
