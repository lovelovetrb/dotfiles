local wezterm = require 'wezterm';
local mac = wezterm.target_triple:find("darwin")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.font_size = 11
config.font = wezterm.font("TerminessTTF Nerd Font", {weight="Regular", stretch="Normal", italic=false}) -- 自分の好きなフォントいれる
-- wezは日本人じゃないのでこれがないとIME動かない
config.use_ime = true
config.color_scheme = "iceberg-dark"                 -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
config.line_height = 1.65

if mac then
  config.font_size = 14
end

return config


