package routers

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func RegisterRoutes(r *gin.Engine) {
	r.Use(cors.Default())
	StaticWebHandler(r)
	r.NoRoute(HandleIndex)
}
