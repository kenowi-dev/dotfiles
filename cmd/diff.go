package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
)

var diffCmd = &cobra.Command{
	Use:   "diff",
	Short: "Compares states",
	Long:  "Compares the installation state with the system state.",
	RunE:  runDiff,
}

func init() {
	RootCmd.AddCommand(diffCmd)
}

func runDiff(_ *cobra.Command, _ []string) (rErr error) {
	fmt.Println("Comparing...")
	return nil
}
