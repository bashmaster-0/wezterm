local wezterm = require("wezterm")

local config = wezterm.config_builder()

local desktop_env = os.getenv("XDG_CURRENT_DESKTOP")

-- rendering
config.font_size = 14
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.max_fps = 240
config.default_cursor_style = "SteadyUnderline"

-- theme
config.color_scheme = "MaterialOcean"

-- window style
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

-- platform specific config
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.default_prog = { 'pwsh.exe', '-NoLogo' }
    config.font_size = 12
    config.window_background_opacity = 1
    config.enable_tab_bar = true
    config.window_decorations = "TITLE | INTEGRATED_BUTTONS | RESIZE"
elseif wezterm.target_triple == "aarch64-apple-darwin" then
    config.font_size = 16
    config.window_background_opacity = 0.85
    config.macos_window_background_blur = 20
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
    config.window_decorations = "NONE"

    if desktop_env == "KDE" then
        config.window_background_opacity = 0.85
        config.kde_window_background_blur = true
    elseif desktop_env == "GNOME" then
        config.window_background_opacity = 1
    end
else
    -- add any breaking config here
end

return config
