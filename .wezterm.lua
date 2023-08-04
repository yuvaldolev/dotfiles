local wezterm = require 'wezterm'
local mux = wezterm.mux

local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()

return {
  audible_bell = "Disabled",
  colors = colors,
  font = wezterm.font 'Fira Code',
  font_size = 15.0,
  font_rules = {
    {
      italic = true,
      intensity = 'Normal',
      font = wezterm.font {
        family = 'Fira Code',
        style = 'Normal',
      },
    },
  },
  hide_tab_bar_if_only_one_tab = true,
  native_macos_fullscreen_mode = true,
  window_frame = window_frame,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  keys = {
    {
      -- Turn off the default CMD-t action.
      key = 't',
      mods = 'CMD',
      action = wezterm.action.DisableDefaultAssignment,
    },
  },
}
