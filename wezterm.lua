local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

config.initial_rows = 30
config.initial_cols = 120
config.font_size = 14
config.color_scheme = "catppuccin-mocha"
config.default_cursor_style = "BlinkingBar"
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"tmux",
	"pwsh.exe",
	"cmd.exe",
	"powershell.exe",
}

config.font = wezterm.font("GeistMono Nerd Font", {
	weight = "Regular",
})

config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

config.window_frame = {
	font = wezterm.font({
		family = "Segoe UI Variable Display",
		weight = "Regular",
	}),
	font_size = 11,
}

config.keys = {
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
