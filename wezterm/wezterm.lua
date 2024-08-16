-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--On windows, name this file .wezterm.lua, put it in $HOME, and add this line:
--config.default_prog = {'powershell.exe.,'NoLogo'}

--Separately, echo $Profile to find a file like "C:\Users\dmsussm\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1", and add the following to it:
--function prompt {
--    $p = $executionContext.SessionState.Path.CurrentLocation
--    $osc7 = ""
--    if ($p.Provider.Name -eq "FileSystem") {
--        $ansi_escape = [char]27
--        $provider_path = $p.ProviderPath -Replace "\\", "/"
--        $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
--    }
--    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
--}

--aesthetics
config.color_scheme = 'Kanagawa (Gogh)'
config.font = wezterm.font {
        family = 'JetBrains Mono',
        harfbuzz_features = {'calt=0','clig=0','liga=0'},
    }
config.font_size = 12
config.window_background_opacity =1
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false

-- non-default keybinds
config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config
