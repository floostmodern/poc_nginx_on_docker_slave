hard-reset:
	rm config/*.conf
	docker network rm ambassador
	docker-compose -f ./ambassador/docker-compose.yml down
	MSG=AMS docker-compose -f ./server_app/docker-compose.yml down

start-ambassador:
	docker network create ambassador
	docker-compose -f ./ambassador/docker-compose.yml up

run-jenkins-ams:
	bash ./jenkins/build_ams.yml

run-jenkins-ldn:
	bash ./jenkins/build_ldn.yml
