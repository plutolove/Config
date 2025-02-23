-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {
}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

config.font = wezterm.font 'Liga CodeNewRomanNerdFont-Regular'

config.font = wezterm.font_with_fallback {
'Liga CodeNewRomanNerdFont-Regular',
'CodeNewRoman Nerd Font Mono'
}

config.font_rules = {
	{
	  intensity = 'Bold',
	  italic = true,
	  font = wezterm.font {
		family = 'CodeNewRoman Nerd Font Mono',
		weight = 'Bold',
		style = 'Italic',
	  },
	},
	{
	  italic = true,
	  intensity = 'Half',
	  font = wezterm.font {
		family = 'CodeNewRoman Nerd Font Mono',
		weight = 'DemiBold',
		style = 'Italic',
	  },
	},
	{
	  italic = true,
	  intensity = 'Normal',
	  font = wezterm.font {
		family = 'CodeNewRoman Nerd Font Mono',
		style = 'Italic',
		weight = 'Bold',
	  },
	},
}

config.window_background_opacity = 0.6
config.color_scheme = 'Catppuccin Mocha'
-- config.font =
  -- wezterm.font('UbuntuMono Nerd Font Mono')
config.font_size = 12

-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
-- end)
--
-- ショートカットキー設定
local act = wezterm.action
config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Ctrl+Shift+tで新しいタブを作成
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+Shift+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Ctrl+左矢印でカーソルを前の単語に移動
  {
    key = "LeftArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "b",
      mods = "META",
    },
  },
  -- Ctrl+右矢印でカーソルを次の単語に移動
  {
    key = "RightArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "f",
      mods = "META",
    },
  },
  -- Ctrl+Backspaceで前の単語を削除
  {
    key = "Backspace",
    mods = "CTRL",
    action = act.SendKey {
      key = "w",
      mods = "CTRL",
    },
  },
}
-- and finally, return the configuration to wezterm
return config
