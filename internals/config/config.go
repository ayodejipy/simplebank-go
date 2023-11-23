package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	Host string
	Port string
	DBNAME string
	User string
	Password string
}

func LoadConfig() *Config  {
	// load env file
	if err := godotenv.Load(".env"); err != nil {
		log.Printf("Failed to load env file: %v", err)
	}

	config := &Config{
		Host: os.Getenv("HOST"),
		Port: os.Getenv("DB_PORT"),
		DBNAME: os.Getenv("DB_NAME"),
		User: os.Getenv("USERNAME"),
		Password: os.Getenv("PASSWORD"),
	}
	// return config
	return config
}