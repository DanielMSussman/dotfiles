-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local launch_menu={}

--- Set Pwsh as the default on Windows
--config.default_prog = { 'powershell.exe', '-NoLogo' }

--aesthetics
config.color_scheme = 'Kanagawa (Gogh)'
config.font = wezterm.font {
        family = 'JetBrains Mono',
        harfbuzz_features = {'calt=0','clig=0','liga=0'},
    }
config.font_size = 13
--config.window_background_opacity =1
config.window_decorations = "TITLE | RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.initial_rows = 40
config.initial_cols = 100
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
-- non-default keybinds
config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config
