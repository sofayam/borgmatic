sudo docker stop /borgmatic
sudo docker rm /borgmatic
sudo docker run -d  -v ./etcborgmatic:/etc/borgmatic -v /volume1:/volume1 -v /volume2:/volume2 --name borgmatic borgmatic

