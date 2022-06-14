package store

import (
	"database/sql"

	"github.com/jodi/models"
)

type Store interface {
	Querier
}

type SQLStore struct {
	db *sql.DB
	*Queries
	Config *models.Config
}

var DBState SQLStore

//NewStore creates a new store
func NewStore(db *sql.DB, config models.Config) {
	DBState = SQLStore{
		db:      db,
		Queries: New(db),
		Config:  &config,
	}
}
