dcup:
		sudo docker-compose up

dcdown:
		sudo docker-compose down

drmi:
		sudo docker rmi jodi_api

pgcontainer:
	sudo docker run --name jodi -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root123 -d postgres

createdb:
	sudo docker exec -it jodi createdb --username=root --owner=root jodi

dropdb:
	sudo docker exec -it jodi dropdb jodi

gooseup: 
		goose -dir ./db/migration/ -v postgres "postgres://root:root123@localhost:5432/jodi?sslmode=disable" up

goosedown: 
		goose -dir ./db/migration/ -v postgres "postgres://root:root123@localhost:5432/jodi?sslmode=disable" down

sqlc:
		sqlc generate

dockerbuild:
		sudo docker build -t jodi:latest .

dockerremove:
		sudo docker rm jodi

startcontainer:
		sudo docker run --name jodi -p 8080:8080  jodi:latest

swagger: 
		swag init

.PHONY:dcup dcdown drmi pgcontainer createdb dropdb gooseup goosedown sqlc dockerbuild dockerremove startcontainer swagger