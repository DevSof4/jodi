package api

import (
	"github.com/gin-gonic/gin"
	"github.com/jodi/handler/hello"
)

var routers *gin.Engine

func Server() {
	// tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	// if err != nil {
	// 	return nil, fmt.Errorf("cannot create token maker: %w", err)
	// }
	setupRouter()
}

func setupRouter() {
	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()
	router.GET("/hello", hello.ShowHello)
	routers = router
}
func Start(address string) error {
	err := routers.Run(address)
	return err
}
