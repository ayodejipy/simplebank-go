package routes

import "github.com/gofiber/fiber/v2"


func SetupRoutes(app *fiber.App) {

	// declare routes
	app.Get("/welcome", func(c *fiber.Ctx) error {
		return c.SendString("Welcome to api")
	})
}