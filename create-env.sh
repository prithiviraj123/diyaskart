#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "=============================="
    echo "Creating  diyasskart$i container.."
    sleep 1
    docker run --name diyasskart$i -d -it prithiviraj123/ajax-tech3 /bin/bash
    echo "diyasskart$i container has been created!"
	echo "=============================="
done
docker inspect --format {{.NetworkSettings.Networks.bridge.IPAddress}} `docker ps -q` > IPs.txt
./create_lb.sh
