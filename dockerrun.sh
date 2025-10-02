sudo docker stop /borgmatic
sudo docker rm /borgmatic
sudo docker run -d -v ./testdata/volume1:/volume1 --name borgmatic borgmatic
