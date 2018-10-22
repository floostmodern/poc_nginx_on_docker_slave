export COMPOSE_PROJECT_NAME=webapp_ldn
export MSG=LDN

docker-compose -f ./server_app/docker-compose.yml up -d

CONTAINER_ID=`docker-compose -f ./server_app/docker-compose.yml ps --quiet`
CONTAINER_NAME=`docker inspect $CONTAINER_ID --format {{.Name}} | cut -c2-`

template="{\"external_hostname\": \"ldn.skylarkcms.com\", \"internal_hostname\": \"$CONTAINER_NAME\"}"
echo $template | mustache - jenkins/template_ambassador_configuration.conf > ambassador/config/ldn.conf

docker exec ambassador nginx -s reload
