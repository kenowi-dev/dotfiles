package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
)

var removeCmd = &cobra.Command{
	Use:   "remove",
	Short: "Removes apps",
	Long:  "Remove the configured apps.",
	RunE:  runRemove,
}

func init() {
	RootCmd.AddCommand(removeCmd)
}

func runRemove(_ *cobra.Command, _ []string) (rErr error) {
	fmt.Println("Removing...")
	return nil
}
