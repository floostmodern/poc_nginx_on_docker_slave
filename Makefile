install-dependencies:
	npm install -g mustache

hard-reset:
	rm -fv ambassador/config/*.conf
	docker-compose -f ./ambassador/docker-compose.yml down
	COMPOSE_PROJECT_NAME=webapp_ams MSG=AMS docker-compose -f ./server_app/docker-compose.yml down -t 0
	COMPOSE_PROJECT_NAME=webapp_ldn MSG=LDN docker-compose -f ./server_app/docker-compose.yml down -t 0
	MSG=LDN docker-compose -f ./server_app/docker-compose.yml down -t 0
	docker network rm ambassador

start-ambassador:
	docker network create ambassador
	docker-compose -f ./ambassador/docker-compose.yml up -d

run-jenkins-ams:
	bash ./jenkins/build_ams.sh

run-jenkins-ldn:
	bash ./jenkins/build_ldn.sh

queries-ams:
	curl 127.0.0.1:8000 -H 'Host: ams.skylarkcms.com'
	curl 127.0.0.1:8001 -H 'Host: ams.skylarkcms.com'

queries-ldn:
	curl 127.0.0.1:8000 -H 'Host: ldn.skylarkcms.com'
	curl 127.0.0.1:8001 -H 'Host: ldn.skylarkcms.com'
