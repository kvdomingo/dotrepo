local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_rows = 30
config.initial_cols = 120
config.font_size = 14
config.color_scheme = "catppuccin-mocha"

config.font = wezterm.font("GeistMono Nerd Font", {
	weight = "Regular",
	line_height = 1.2,
})

config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

config.window_frame = {
	font = wezterm.font({
		family = "Segoe UI Variable Display",
		weight = "Regular",
	}),
	font_size = 11,
}

config.default_prog = {
	"wsl",
	"-d",
	"Ubuntu",
	"--cd",
	"/home/kvdomingo",
}

config.launch_menu = {
	{
		args = { "wsl", "-d", "Ubuntu", "--cd", "/home/kvdomingo" },
		label = "WSL",
	},
	{
		args = { "pwsh.exe" },
		label = "PowerShell",
	},
}

return config
