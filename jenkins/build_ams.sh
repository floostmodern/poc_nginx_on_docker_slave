export COMPOSE_PROJECT_NAME=webapp_ams
export MSG=AMS

docker-compose -f ./server_app/docker-compose.yml up -d

CONTAINER_ID=`docker-compose -f ./server_app/docker-compose.yml ps --quiet`
CONTAINER_NAME=`docker inspect $CONTAINER_ID --format {{.Name}} | cut -c2-`

template="{\"external_hostname\": \"ams.skylarkcms.com\", \"internal_hostname\": \"$CONTAINER_NAME\"}"
echo $template | mustache - jenkins/template_ambassador_configuration.conf > ambassador/config/ams.conf

docker exec ambassador nginx -s reload
