-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--aesthetics
config.color_scheme = 'Kanagawa (Gogh)'

config.font = wezterm.font(
  { -- Normal text
  family='MonaspiceAR Nerd Font Mono',
  harfbuzz_features={ 'calt', 'ss03'},
})
--config.font = wezterm.font {
--        --family = 'JetBrains Mono',
--        family = 'JetBrains Mono',
--        harfbuzz_features = {'calt=0','clig=0','liga=0'},
--    }
--https://www.nerdfonts.com/font-downloads
config.font_rules = {
  { -- Italic
    intensity = 'Normal',
    italic = true,
    font = wezterm.font({
      -- family="Monaspace Radon",  -- script style
      family='MonaspiceXE Nerd Font Mono', -- courier-like
      style = 'Italic',
    })
  },

  { -- Bold
    intensity = 'Bold',
    italic = false,
    font = wezterm.font( {
      family='MonaspiceAR Nerd Font Mono',
      family='MonaspiceAR Nerd Font Mono',
      -- weight='ExtraBold',
      weight='Bold',
      })
  },

  { -- Bold Italic
    intensity = 'Bold',
    italic = true,
    font = wezterm.font( {
      family='MonaspiceXE Nerd Font Mono',
      style='Italic',
      weight='Bold',
      }
    )
  },
}

config.font_size = 18
config.window_background_opacity =1
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = false

config.initial_rows = 40
config.initial_cols = 100

-- non-default keybinds
config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config
