build: 
	go build -o bin/simplebank cmd/app/main.go && bin/simplebank

run: 
	go run cmd/app/main.go