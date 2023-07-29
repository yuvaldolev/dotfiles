local wezterm = require 'wezterm'
local mux = wezterm.mux

return {
    audible_bell = "Disabled",
    color_scheme = "GruvboxDarkHard",
    font = wezterm.font 'Fira Code',
    font_size = 15.0,
    hide_tab_bar_if_only_one_tab = true,
    native_macos_fullscreen_mode = true,
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
