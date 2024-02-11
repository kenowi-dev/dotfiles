package cmd

import (
	"github.com/lmittmann/tint"
	"github.com/mattn/go-colorable"
	"github.com/spf13/cobra"
	"log/slog"
	"os"
)

var RootCmd = &cobra.Command{
	Use:               "dotfiles",
	Short:             "Dotfiles manager",
	Long:              "Dotfiles Manager",
	SilenceUsage:      true,
	DisableAutoGenTag: true,
	Args:              cobra.NoArgs,
	Version:           "TODO: Link with version command",
	PersistentPreRunE: func(cmd *cobra.Command, args []string) error {
		if err := setupLogger(); err != nil {
			return err
		}
		return nil
	},
}

var (
	debug     bool
	logLevel  string
	logFormat string
)

func init() {
	RootCmd.PersistentFlags().StringVar(&logLevel, "log-level", slog.LevelInfo.String(), "The logging verbosity. Can be set to DEBUG, INFO, WARN or ERROR.")
	RootCmd.PersistentFlags().StringVar(&logFormat, "log-format", "text", `Format used for logging. Allowed values are "text", "json" or "color".`)
	RootCmd.PersistentFlags().BoolVar(&debug, "debug", false, "Enabled the debug mode.")
}

// setupLogger sets up the global logger using the app's configuration.
func setupLogger() error {

	lvl := slog.LevelInfo
	var logger *slog.Logger

	err := lvl.UnmarshalText([]byte(logLevel))
	if err != nil {
		return err
	}

	handlerOps := &slog.HandlerOptions{
		AddSource: debug,
		Level:     lvl,
	}

	switch logFormat {
	case "text":
		logger = slog.New(slog.NewTextHandler(os.Stdout, handlerOps))
	case "json":
		logger = slog.New(slog.NewJSONHandler(os.Stdout, handlerOps))
	case "color":
		logger = slog.New(tint.NewHandler(colorable.NewColorableStdout(), &tint.Options{
			AddSource: handlerOps.AddSource,
			Level:     handlerOps.Level,
		}))
	}
	slog.SetDefault(logger)
	return nil
}
