local wezterm = require 'wezterm';
local mac = wezterm.target_triple:find("darwin")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- 背景透過
config.window_background_opacity = 0.80

-- 最初からフルスクリーンで起動
-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
-- end)

config.font_size = 13
config.font = wezterm.font("FirgeNerd Console", { weight = "Regular", stretch = "Normal", italic = false })      -- 自分の好きなフォントいれる
-- config.font = wezterm.font("TerminessTTF Nerd Font", { weight = "Regular", stretch = "Normal", italic = false }) -- 自分の好きなフォントいれる
-- wezは日本人じゃないのでこれがないとIME動かない
config.use_ime = true
config.color_scheme =
"iceberg-dark" -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
config.line_height = 1.65

if mac then
  config.font_size = 16
  config.font = wezterm.font("FirgeNerd Console", { weight = "Regular", stretch = "Normal", italic = false }) -- 自分の好きなフォントいれる
end

-- tab bar
config.use_fancy_tab_bar = false
config.colors = {
  cursor_bg = "#c6c8d1",
  tab_bar = {
    background = "#1b1f2f",

    active_tab = {
      bg_color = "#444b71",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = "#282d3e",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    inactive_tab_hover = {
      bg_color = "#1b1f2f",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = true,
      strikethrough = false,
    },

    new_tab = {
      bg_color = "#1b1f2f",
      fg_color = "#c6c8d1",
      italic = false
    },

    new_tab_hover = {
      bg_color = "#444b71",
      fg_color = "#c6c8d1",
      italic = false
    },
  }
}


return config
