docker-compose:
	docker-compose up -d

docker-compose-down:
	docker-compose down

htpasswd:
	htpasswd -c nginx/conf.d/.htpasswd root
