local wezterm = require('wezterm')

local config = wezterm.config_builder()

local desktop_env = os.getenv("XDG_CURRENT_DESKTOP")

-- rendering
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 14
config.max_fps = 240

config.default_cursor_style = 'SteadyUnderline'

-- theme
config.color_scheme = 'MaterialOcean'
config.window_background_opacity = 0.85

-- window style
config.enable_tab_bar = false
config.use_fancy_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- platform specific config
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.win32_system_backdrop = 'Acrylic'
elseif wezterm.target_triple == 'aarch64-apple-darwin' then
  config.macos_window_background_blur = 20
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  config.window_decorations = "NONE"

  if desktop_env == "KDE" then
    config.kde_window_background_blur = true
  elseif desktop_env == "GNOME" then
    config.window_background_opacity = 1.00
  end
else
-- add any breaking config here
end

return config
