package database

import (
	"database/sql"
	"fmt"

	"github.com/ayodejipy/simple-bank-go/internals/config"
)

type DBCon struct {
	db *sql.DB
}


func InitDBConnection(config *config.Config) (*DBCon)  {
	connectionString := fmt.Sprintf("postgresql://%v:%v@%v:%v/simplebank?sslmode=disable", config.User, config.Password, config.Host, config.Port)
	db, err := sql.Open("postgres", connectionString)

	if err != nil {
		panic(err) // stop execution and throw error
	}

	defer db.Close();

	if err := db.Ping(); err != nil {
		panic(err)
	}

	fmt.Println("Database connected successfully!.")

	return &DBCon{ db }
}