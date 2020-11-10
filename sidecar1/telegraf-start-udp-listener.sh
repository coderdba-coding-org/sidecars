# Orig from https://thenewstack.io/how-to-setup-influxdb-telegraf-and-grafana-on-docker-part-2/
#docker run -d --user 998:998 --name=telegraf \
      #--net=container: \
      #-e HOST_PROC=/host/proc \
      #-v /proc:/host/proc:ro \
      #-v /etc/telegraf/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
      #telegraf

chmod 666 /var/run/docker.sock


docker run -d --user 998:998 --name=telegraf \
      --net=monitoring \
      --memory=1024m \
      --cpus=2 \
      --expose=8094/udp \
      -p 8094:8094/udp \
      -e HOST_PROC=/host/proc \
      -v /proc:/host/proc:ro \
      -v /var/run/docker.sock:/var/run/docker.sock:ro \
      -v /etc/telegraf/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
      telegraf

# for exposing tcp socket:
      #--expose=8094/tcp \
      #-p 8094:8094/tcp \
