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

config.font_size = 11
config.font = wezterm.font("TerminessTTF Nerd Font", { weight = "Regular", stretch = "Normal", italic = false }) -- 自分の好きなフォントいれる
-- wezは日本人じゃないのでこれがないとIME動かない
config.use_ime = true
config.color_scheme =
"iceberg-dark"                       -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
config.line_height = 1.65

if mac then
  config.font_size = 16
  config.font = wezterm.font("FirgeNerd Console", { weight = "Regular", stretch = "Normal", italic = false }) -- 自分の好きなフォントいれる
end

return config
