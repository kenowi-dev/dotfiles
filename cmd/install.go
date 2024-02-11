package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"log/slog"
)

var installCmd = &cobra.Command{
	Use:   "install",
	Short: "Install apps",
	Long:  "Installs the configured apps.",
	RunE:  runInstall,
}

var (
	all bool
)

func init() {
	installCmd.Flags().BoolVarP(&all, "all", "a", false, "Install all apps")
	RootCmd.AddCommand(installCmd)
}

func runInstall(_ *cobra.Command, _ []string) (rErr error) {
	if all {
		fmt.Println("Installing all...")
	} else {
		fmt.Println("Installing...")
	}

	slog.Debug("Debugging")
	slog.Info("Information")
	slog.Warn("Warning")
	slog.Error("Error")
	return nil
}
