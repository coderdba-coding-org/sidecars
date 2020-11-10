docker stop telegraf
docker rm telegraf
./telegraf-start.sh
sleep 2
docker logs telegraf
