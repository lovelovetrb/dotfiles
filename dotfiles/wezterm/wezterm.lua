local wezterm = require 'wezterm';
local mac = wezterm.target_triple == "x86_64-apple-darwin"
-- 最初からフルスクリーンで起動
-- local mux = wezterm.mux
-- if mac then
--   wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
--   end)
-- end

local font_size = 10.5

if mac then
  font_size = 15
end

return {
  -- 背景透過
  window_background_opacity = 0.7,
  font_size = font_size,
  font = wezterm.font("FirgeNerd Console", { weight = "Regular", stretch = "Normal", italic = false }), -- 自分の好きなフォントいれる
  initial_rows = 65,
  initial_cols = 260,
  window_decorations = "RESIZE",
  -- font = wezterm.font("TerminessTTF Nerd Font", { weight = "Regular", stretch = "Normal", italic = false })
  -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
  color_scheme = "Kanagawa (Gogh)",
  line_height = 1.65,

  -- tab bar
  use_fancy_tab_bar = false,
  colors = {
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
    },
  }
}
