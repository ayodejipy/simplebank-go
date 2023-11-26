URL = postgresql://postgres:admin123@localhost:5432/simplebank?sslmode=disable
FILEPATH = internals/database/migrations/


build: 
	go build -o bin/simplebank cmd/app/main.go && bin/simplebank

run: 
	go run cmd/app/main.go

migrate:
	migrate create -ext sql -dir $(FILEPATH) -seq init_migration

migrate-up:
	migrate -path $(FILEPATH) -database "$(URL)" -verbose up

migrate-down:
	migrate -path $(FILEPATH) -database "$(URL)" -verbose down

sqlc:
	sqlc generate


.PHONY: build run migrate migrate-up migrate-down sqlc