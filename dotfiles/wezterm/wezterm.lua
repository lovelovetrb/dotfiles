local wezterm = require 'wezterm';

return {
  font = wezterm.font("TerminessTTF Nerd Font"), -- 自分の好きなフォントいれる
  use_ime = true,                                -- wezは日本人じゃないのでこれがないとIME動かない
  font_size = 11.5,
  color_scheme = "iceberg-dark",                 -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
  line_height = 1.65,
}
