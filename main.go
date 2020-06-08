package main

import (
	"log"
	"os"

	"github.com/blueworrybear/full-stack-template/routers"
	"github.com/gin-gonic/gin"
	"github.com/urfave/cli"
)

var cmdWeb = cli.Command{
	Name:   "web",
	Usage:  "Start web server",
	Action: runCmdWeb,
}

func main() {
	app := cli.NewApp()
	app.Name = "web"
	app.Usage = "Web server"
	app.Version = "0.2-beta"
	app.Commands = []cli.Command{cmdWeb}
	err := app.Run(os.Args)
	if err != nil {
		log.Fatalf("Failed to run app with %s: %v", os.Args, err)
	}
}

func runCmdWeb(c *cli.Context) error {
	r := gin.Default()
	routers.RegisterRoutes(r)
	r.Run(":6060")
	return nil
}
