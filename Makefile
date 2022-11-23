NAME = inception

all:  reload

ubuntu:
	@ echo "127.0.0.1 dlanzilo.42.fr" >> /etc/hosts

stop:
	@ sudo docker-compose -f srcs/docker-compose.yml down

clean: stop prune
	@ rm -rf ~/home/dlanzilo/data/wordpress && rm -rf ~/home/dlanzilo/data/mysql

prune: clean
	@ sudo docker system prune -af

reload: 
	@ sudo docker-compose -f srcs/docker-compose.yml up --build

.PHONY: ubuntu stop clean prune reload all