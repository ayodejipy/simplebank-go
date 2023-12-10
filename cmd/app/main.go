package main

import (
	"log"

	"github.com/ayodejipy/simple-bank-go/internals/config"
	"github.com/ayodejipy/simple-bank-go/internals/database"
	"github.com/ayodejipy/simple-bank-go/internals/routes"
	"github.com/gofiber/fiber/v2"
	_ "github.com/lib/pq"
)

func main() {
	// TODO: setup routes; connect to database

	app := fiber.New()
	routes.SetupRoutes(app)

	// load config files and pass them
	config := config.LoadConfig() 
	database.InitDBConnection(config)

	// serve and listen to app
	log.Fatal(app.Listen(":3001"))
}