PORT = 8000

build:	
	docker build -t gasbo/simple-api-db ./db
	docker build -t gasbo/simple-api-app ./app

run:
	docker run -d --name simple-api-db -e MYSQL_ROOT_PASSWORD=12345 --rm gasbo/simple-api-db ;\
	DB_IP=$$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' simple-api-db) ;\
	docker run -d --name simple-api-app -e DATABASE_HOST=$$DB_IP -p $(PORT):4000 --rm gasbo/simple-api-app 

test:
	
	pytest -s ./app/tests/api_test.py

stop:
	docker stop simple-api-app
	docker stop simple-api-db


