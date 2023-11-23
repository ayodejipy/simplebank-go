build: 
	go build -o bin/simplebank cmd/app/main.go && bin/simplebank

run: 
	go run cmd/app/main.go

migrate:
	migrate create -ext sql -dir internals/database/migrations/ -seq init_migration