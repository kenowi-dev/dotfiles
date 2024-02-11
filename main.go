package main

import (
	"github.com/kenowi-dev/dotfiles/cmd"
	"os"
)

func main() {
	if err := cmd.RootCmd.Execute(); err != nil {
		os.Exit(1)
	}
}
