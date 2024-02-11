package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
)

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Display version information",
	Long:  "Print information about the currently running version.",
	RunE:  runVersion,
}

func init() {
	RootCmd.AddCommand(versionCmd)
}

func runVersion(_ *cobra.Command, _ []string) (rErr error) {
	fmt.Println("Version X.x")
	return nil
}
