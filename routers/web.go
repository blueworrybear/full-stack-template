package routers

import (
	"net/http"

	"github.com/blueworrybear/full-stack-template/web"
	"github.com/gin-gonic/gin"
)

// HandleIndex return index.html
func HandleIndex(c *gin.Context) {
	html := web.MustLookup("/index.html")
	c.Data(200, "text/html; charset=UTF-8", html)
}

// StaticWebHandler registers gin handler for static web application
func StaticWebHandler(r *gin.Engine) {
	h := http.FileServer(web.New())
	r.Any("/js/*filepath", gin.WrapH(h))
	r.Any("/css/*filepath", gin.WrapH(h))
	r.Any("/img/*filepath", gin.WrapH(h))
	r.Any("/fonts/*filepath", gin.WrapH(h))
	r.Any("/favicon.ico", gin.WrapH(h))
	r.Any("/favicon.png", gin.WrapH(h))
}
