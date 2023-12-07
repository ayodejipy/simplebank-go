package database

import (
	"database/sql"
	"fmt"

	"github.com/ayodejipy/simple-bank-go/internals/config"
)

type DB struct {
	db
}


func InitDBConnection(config config.Config)  {
	connectionString := fmt.Sprintf("postgresql://postgres:admin123@localhost:5432/simplebank?sslmode=disable")
	db, err := sql.Open("postgres", connectionString)

	if err != nil {
		panic(err) // stop execution and throw error
	}

	defer db.Close();

	if err := db.Ping(); err != nil {
		panic(err)
	}

	fmt.Println("Database connected successfully!.")
}