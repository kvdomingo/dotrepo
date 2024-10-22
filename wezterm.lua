local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Batman"
config.font = wezterm.font("FantasqueSansM Nerd Font")

return config
