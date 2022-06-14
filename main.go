package main

import (
	"database/sql"
	"log"

	"github.com/jodi/api"
	"github.com/jodi/store"
	"github.com/jodi/utils"
	_ "github.com/lib/pq"
)

func main() {
	config, err := utils.LoadConfig(".")
	if err != nil {
		log.Fatal("Configuration could not be loaded:", err)
	}
	conn, err := sql.Open(config.DBDriver, config.DBSource)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}
	store.NewStore(conn, config)
	api.Server()
	err = api.Start(config.ServerAddress)
	if err != nil {
		log.Fatal("Error while starting server:", err)
	}
}
