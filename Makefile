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

pgooseup:
		goose -dir ./db/migration/ -v postgres "postgres://root:Tinkune7@jodi-db.calhwakwddpf.ap-south-1.rds.amazonaws.com:5432/jodi" up

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

hexran:
		openssl rand -hex 64 | head -c 32

getsecret:
		aws secretsmanager get-secret-value --secret-id jodi --query SecretString --output text | jq -r 'to_entries|map("\(.key)=\(.value)")|.[]' > app.env
ecrpipe:
		aws ecr get-login-password | docker login --username AWS --password-stdin 832947262004.dkr.ecr.ap-south-1.amazonaws.com
runimg:
		docker run -p 8080:8080 832947262004.dkr.ecr.ap-south-1.amazonaws.com/jodi:7aa2907fa96fc8670b27368eceef96448692638f

kubeconfigaws:
		aws eks update-kubeconfig --name jodi --region ap-south-1
kubeconnnect:
		kubectl config use-context arn:aws:eks:ap-south-1:832947262004:cluster/jodi
kubectlinfo:
		kubectl cluster-info
AWSuser:
		export AWS_PROFILE=github
awsauthapply:
		kubectl apply -f eks/aws-auth.yaml
kubectldeploy:
		kubectl apply -f eks/deployment.yaml
kubectlservice:
		kubectl apply -f eks/service.yaml
kubectlingress:
		kubectl apply -f eks/ingress.yaml
kubectlissure:
		kubectl apply -f eks/issuer.yaml

.PHONY:dcup dcdown drmi pgcontainer createdb dropdb gooseup goosedown sqlc dockerbuild dockerremove startcontainer swagger hexran getsecret pgooseup ecrpipe runimg kubeconfigaws kubeconnnect kubectlinfo AWSuser awsauthapply kubectldeploy kubectlingress kubectlservice kubectlissure