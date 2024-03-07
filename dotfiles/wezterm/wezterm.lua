local wezterm = require 'wezterm';
local intelMac = wezterm.target_triple == "x86_64-apple-darwin"
local armMac = wezterm.target_triple == "aarch64-apple-darwin"
--
-- 最初からフルスクリーンで起動
-- local mux = wezterm.mux
-- if mac then
--   wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
--   end)
-- end

local font_size = 10.5
local window_background_opacity = 1

if intelMac or armMac then
  font_size = 13.5
  window_background_opacity = 0.45
end

local initial_cols = 260

if armMac then
  initial_cols = 280
end

return {
  -- 背景透過
  window_background_opacity = window_background_opacity,
  macos_window_background_blur = 30,
  font_size = font_size,
  font = wezterm.font("Moralerspace Neon NF", { weight = "Bold", stretch = "Normal", italic = false }),
  -- font = wezterm.font("FirgeNerd Console", { weight = "Bold", stretch = "Normal", italic = false }), 
  -- font = wezterm.font("TerminessTTF Nerd Font", { weight = "Regular", stretch = "Normal", italic = false }),
  initial_rows = 65,
  initial_cols = initial_cols,
  window_decorations = "RESIZE",
  use_ime = true,
  ime_preedit_rendering = "Builtin",
  -- 自分の好きなテーマ探す https://wezfurlong.org/wezterm/colorschemes/index.html
  color_scheme = "Kanagawa (Gogh)",
  line_height = 1.65,

  window_close_confirmation = 'NeverPrompt',


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
